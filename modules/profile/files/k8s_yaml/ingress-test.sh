kubectl apply -f deployment.yaml

sleep 5
kubectl apply -f service.yaml

sleep 5
kubectl apply -f ingress.yaml
