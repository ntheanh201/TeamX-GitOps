#!/bin/bash

echo "====== PULL ======"
git pull

echo "====== K8S ======"
cd kustomize
kustomize build . | k3s kubectl apply -f -