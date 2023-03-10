#!/bin/bash

git config --global user.email "ntheanh201@gmail.com"
git config --global user.name "CircleCI"

echo "====== PULL ======"
git pull

echo "====== UPDATE IMAGE VERSION ======"
echo $TAG
sed -i "s/teamx-gitops-demo:.*/teamx-gitops-demo:$TAG/g" kustomize/overlays/circle/deployment_patch.yaml

echo "====== K8S ======"
cd kustomize
kustomize build overlays/circle | k3s kubectl apply -f -

if [[ $(git status --porcelain) ]]; then
  echo "====== COMMIT NEW CHANGES ======"
  git add .
  git commit -m "BACKEND: update image version $TAG"
  git push origin master
else
  echo "====== NO CHANGES ======"
fi
