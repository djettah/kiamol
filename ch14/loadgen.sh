#!/bin/bash

URL=$(kubectl get svc todo-proxy -o jsonpath='127.0.0.1:38084' -n kiamol-ch14-test)

for i in {1..5000}
do
   curl -s "$URL/List" > /dev/null
done