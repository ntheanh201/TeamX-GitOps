#!/bin/bash

git config --global user.email "ntheanh201@gmail.com"
git config --global user.name "CircleCI + ArgoCD"

echo "====== PULL ======"
git pull

echo "====== UPDATE IMAGE VERSION ======"
echo $TAG
sed -i "s/teamx-gitops-demo:.*/teamx-gitops-demo:$TAG/g" kustomize/overlays/argo/deployment_patch.yaml

if [[ $(git status --porcelain) ]]; then
  echo "====== COMMIT NEW CHANGES ======"
  git add .
  git commit -m "BACKEND: update image version $TAG"
  git push origin master
else
  echo "====== NO CHANGES ======"
fi
