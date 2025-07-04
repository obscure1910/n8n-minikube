#! /bin/bash

minikube start --cpus 3 --memory 5120 -p n8n && \
minikube -p n8n addons enable ingress && \
minikube -p n8n addons enable metrics-server