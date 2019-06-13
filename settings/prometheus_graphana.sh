#!/usr/bin/env bash

kubectl apply --kustomize github.com/kubernetes/ingress-nginx/deploy/prometheus/
kubectl get svc -n ingress-nginx
# take port of prometheus and add to host
kubectl apply --kustomize github.com/kubernetes/ingress-nginx/deploy/grafana/

