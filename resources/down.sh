#!/bin/zsh
kubectl delete -f application.yaml 
kubectl delete -f  authdb.yml
kubectl delete -f guitardb.yml

