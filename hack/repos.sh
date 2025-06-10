#!/usr/bin/env bash

set -eu

CHARTS="$1"

# Ensure yq is installed
if ! command -v yq &> /dev/null; then
  echo "Error: yq is not installed. Please install it first."
  exit 1
fi

# Ensure helm is installed
if ! command -v helm &> /dev/null; then
  echo "Error: helm is not installed. Please install it first."
  exit 1
fi

# Traverse the CHARTS directory and find Chart.yaml files
find "$CHARTS" -type f -name "Chart.yaml" | while read -r chart_file; do
  echo "Processing $chart_file..."
  
  # Extract all repository URLs from .dependencies
  repositories=$(yq eval '.dependencies[].repository' "$chart_file" 2>/dev/null)

  # Check if repositories exist
  if [ -z "$repositories" ]; then
    echo "No dependencies with repositories found in $chart_file."
    continue
  fi

  # Add each repository to Helm
  while IFS= read -r repo; do
    if [ -n "$repo" ]; then
      repo_name=$(echo "$repo" | sed 's|http[s]*://||' | sed 's|/|-|g') # Create a unique repo name
      echo "Adding Helm repository: $repo_name ($repo)"
      helm repo add "$repo_name" "$repo"
    fi
  done <<< "$repositories"
done

# Attempt to update repositories, capturing all output (stdout & stderr)
# The 'if !' structure prevents 'set -e' from exiting the script immediately on failure
if ! output=$(helm repo update 2>&1); then
  # The command failed. Check if it's the specific error we want to ignore.
  if echo "$output" | grep -q "no repositories found"; then
    echo "No Helm repositories found to update. Exiting gracefully."
    exit 0 # Exit successfully
  else
    # For any other error, print the message and exit with an error code.
    echo "Error updating Helm repositories:" >&2
    echo "$output" >&2
    exit 1
  fi
fi

# If the command was successful, print its output
echo "$output"
echo "Helm repositories updated successfully."

echo "Done."