//go:build none
// +build none

package hack

import (
	_ "github.com/losisin/helm-values-schema-json"
	_ "github.com/mikefarah/yq/v4"
	_ "github.com/norwoodj/helm-docs/cmd/helm-docs"
	_ "golang.stackrox.io/kube-linter/cmd/kube-linter"
)
