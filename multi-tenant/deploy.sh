#!/bin/bash

TENANT=$1

export TENANT=$TENANT
export FRONTEND_IMAGE=nvenkatasaikiran/frontend:v1
export BACKEND_IMAGE=venkatasaikiran/backendapi:v1
export REDIS_IMAGE=redis:7-alpine

for file in namespace quota limitrange frontend backend redis services networkpolicy
do
  envsubst < ${file}.yaml | kubectl apply -f -
done

echo "✅ Tenant $TENANT deployed"
