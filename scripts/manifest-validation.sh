#!/bin/bash

set -e  # Exit on error

echo "🚀 Starting Kustomize Manifest Validation..."

# Validate all overlays under manifests/apps/*/overlays/*
for app_dir in manifests/apps/*; do
  if [ -d "$app_dir" ]; then
    app_name=$(basename "$app_dir")
    overlays_dir="$app_dir/overlays"

    # Check if overlays exist for the application
    if [ -d "$overlays_dir" ]; then
      echo "🔍 Validating overlays for $app_name..."

      # Loop through each overlay (e.g., dev, staging)
      for overlay in "$overlays_dir"/*; do
        if [ -d "$overlay" ]; then
          echo "🔍 Validating overlay: $overlay"

          # Validate with kubeconform
          kustomize build "$overlay" | kubeconform -strict -summary -schema-location default
	  echo 
        fi
      done
    fi
  fi
done

echo "✅ All Kustomize manifests validated successfully!"
