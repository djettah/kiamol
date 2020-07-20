#!/bin/sh

# set up access to Kube API
kubectl config set-cluster default --server=https://kubernetes.default --certificate-authority=/var/run/secrets/kubernetes.io/serviceaccount/ca.crt
kubectl config set-context default --cluster=default
kubectl config set-credentials user --token=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token)
kubectl config set-context default --user=user
kubectl config use-context default

label=$(kubectl get ns kiamol-ch19 -o jsonpath='{.metadata.labels.kiamol}')
sed -i "s/{LABEL}/$label/g" /config-in/config.json
cp /config-in/config.json /config-out/config.json

echo "** Namespace label: $label. Written to config file **"