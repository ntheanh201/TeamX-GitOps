#!/bin/bash

git config --global user.email "ntheanh201@gmail.com"
git config --global user.name "Bot CI"

echo "====== PULL ======"
git pull

echo "====== K8S ======"
cd kustomize
kustomize build . | k3s kubectl apply -f -