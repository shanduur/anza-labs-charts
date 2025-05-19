package main

import (
	"bytes"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"text/template"

	"github.com/Masterminds/sprig/v3"

	"gopkg.in/yaml.v3"
)

const (
	readmeTemplateFile = "./README.md.gotpl"
)

var (
	chartsDirs = []string{"./charts", "./deprecated"}
)

// Chart represents the structure of a Chart.yaml file.
type Chart struct {
	Name       string `yaml:"name"`
	Version    string `yaml:"version"`
	AppVersion string `yaml:"appVersion"`
	Deprecated bool   `yaml:"deprecated"`
}

func main() {
	charts, err := loadCharts(chartsDirs)
	if err != nil {
		log.Fatalf("Error loading charts: %v", err)
	}

	readme, err := renderReadme(charts)
	if err != nil {
		log.Fatalf("Error rendering README: %v", err)
	}

	err = os.WriteFile("README.md", []byte(readme), 0644)
	if err != nil {
		log.Fatalf("Error writing README.md: %v", err)
	}

	log.Print("README.md generated successfully.")
}

// loadCharts recursively loads all Chart.yaml files from the given directory.
func loadCharts(dirs []string) ([]Chart, error) {
	var charts []Chart

	for _, dir := range dirs {
		err := filepath.Walk(dir, func(path string, info os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if info.IsDir() || filepath.Base(path) != "Chart.yaml" {
				return nil
			}

			chart, err := loadChart(path)
			if err != nil {
				return fmt.Errorf("failed to load %s: %w", path, err)
			}
			charts = append(charts, chart)
			return nil
		})
		if err != nil {
			return nil, err
		}
	}

	return charts, nil
}

// loadChart parses a single Chart.yaml file into a Chart struct.
func loadChart(path string) (Chart, error) {
	data, err := os.ReadFile(path)
	if err != nil {
		return Chart{}, err
	}

	var chart Chart
	if err := yaml.Unmarshal(data, &chart); err != nil {
		return Chart{}, err
	}

	// chart.Description = strings.ReplaceAll(chart.Description, "\n", " ")
	// chart.Description = strings.ReplaceAll(chart.Description, "\r", " ")

	return chart, nil
}

// renderReadme generates the README.md content using the charts data.
func renderReadme(charts []Chart) (string, error) {
	readmeTemplate, err := os.ReadFile(readmeTemplateFile)
	if err != nil {
		return "", err
	}

	tmpl, err := template.New("readme").
		Funcs(sprig.FuncMap()).
		Parse(string(readmeTemplate))
	if err != nil {
		return "", err
	}

	var buf bytes.Buffer
	if err := tmpl.Execute(&buf, charts); err != nil {
		return "", err
	}

	return buf.String(), nil
}
