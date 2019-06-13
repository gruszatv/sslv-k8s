#!/usr/bin/env bash
# Assign host ip to local domain
echo "$(minikube ip) alex.sitdikov" | sudo tee -a /etc/hosts

# generate key
openssl req -x509 -newkey rsa:4096 -sha256 -nodes -keyout tls.key -out tls.crt -subj "/CN=alex.sitdikov" -days 365

# generate secret  ( it may exist )
kubectl create secret tls alex-sitdikov-tls --cert=tls.crt --key=tls.key



# automatic
openssl genrsa -out ca.key 2048
openssl req -x509 -new -nodes -key ca.key -sha256 -subj "/CN=alex.sitdikov" -days 1024 -out ca.crt

# generate secret  ( it may exist )
kubectl create secret tls alex-sitdikov-tls --cert=ca.crt --key=ca.key

