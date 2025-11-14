#! /bin/bash

minikube start --cpus 6 --memory 6144 -p n8n && \
minikube -p n8n