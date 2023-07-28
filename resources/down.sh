#!/bin/zsh
kubectl delete -f application.yml 
kubectl delete -f  authdb.yml
kubectl delete -f guitardb.yml

