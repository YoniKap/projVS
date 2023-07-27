#!/bin/zsh
kubectl apply -f  application.yaml 
kubectl apply -fauthdb.yml
kubectl apply -f guitardb.yml

