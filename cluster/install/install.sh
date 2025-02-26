#!/bin/bash

if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "This script is intended to run on Linux. Please visit the following URL to install on your OS:"
    exit 1
fi

if ! [ -x "$(command -v kubectl)" ]; then
    echo "kubectl is not installed. Please install kubectl first."
    exit 1
fi

if ! [ -x "$(command -v kind)" ]; then
    echo "kind is not installed. Please install kind first."
    exit 1
fi

if ! [ -x "$(command -v helm)" ]; then
    echo "helm is not installed. Please install helm first."
    exit 1
fi

# Create a kind cluster

kind delete cluster 
kind create cluster --config ./cluster/install/kind.yaml
kubectl cluster-info --context kind-kind


# install nginx ingress controller to kind
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
kubectl rollout status -w deployment/ingress-nginx-controller -n ingress-nginx --timeout=5m