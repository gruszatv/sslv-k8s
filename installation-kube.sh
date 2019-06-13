#!/usr/bin/env bash

# Ingress Control installation and running
kubectl create clusterrolebinding cluster-admin-binding \
  --clusterrole cluster-admin \
  --user $(gcloud config get-value account)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml
minikube addons enable ingress
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud-generic.yaml


# Helm and Tiller and running
curl -LO https://git.io/get_helm.sh
chmod 700 get_helm.sh
./get_helm.sh
helm init

# Cert - Manager
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
kubectl apply -f https://github.com/jetstack/cert-manager/releases/download/v0.8.0/cert-manager.yaml
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.8/deploy/manifests/00-crds.yaml
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install \
  --name cert-manager \
  --namespace cert-manager \
  --version v0.8.0 \
  jetstack/cert-manager

# Assigning local dev
sudo sed -i '' -e '$ d' /etc/hosts
echo "$(minikube ip) ssemail.staging" | sudo tee -a /etc/hosts

# Prometheus - Graphana instalation
kubectl apply --kustomize github.com/kubernetes/ingress-nginx/deploy/prometheus/
kubectl get svc -n ingress-nginx
kubectl get nodes -o wide
kubectl apply --kustomize github.com/kubernetes/ingress-nginx/deploy/grafana/
kubectl get svc -n ingress-nginx