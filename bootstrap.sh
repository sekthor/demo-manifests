#!/usr/bin/bash

kubectl create namespace argocd
helm template argocd oci://ghcr.io/argoproj/argo-helm/argo-cd --namespace argocd | kubectl apply -f - 
kubectl apply -f argo-apps.yaml

alias argopw="kubectl get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"