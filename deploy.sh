#!/usr/bin/env bash

docker build -t grusza/sslv-client:latest -t grusza/sslv-client:$SHA -f ./client/Dockerfile ./client
docker build -t grusza/sslv-server:latest -t grusza/sslv-server:$SHA -f ./server/Dockerfile ./server
docker build -t grusza/sslv-worker:latest -t grusza/sslv-worker:$SHA -f ./worker/Dockerfile ./worker

docker push grusza/sslv-client:latest
docker push grusza/sslv-server:latest
docker push grusza/sslv-worker:latest

docker push grusza/sslv-client:$SHA
docker push grusza/sslv-server:$SHA
docker push grusza/sslv-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=grusza/sslv-server:$SHA
kubectl set image deployments/client-deployment client=grusza/sslv-client:$SHA
kubectl set image deployments/worker-deployment worker=grusza/sslv-worker:$SHA
