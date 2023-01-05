#!/bin/bash

cho $TAG
echo "====== PULL ======"
git pull

echo "====== K8S ======"
#cd kustomize
#kustomize build . | k3s kubectl apply -f -
kubectl rollout restart deployment/teamx-gitops-simple-app -n teamx