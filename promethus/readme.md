helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install monitoring prometheus-community/kube-prometheus-stack \ --namespace monitoring \ --create-namespace
# after command to create monitoring it will take time up 5 to 10 minutes

kubectl get pods -n monitoring
# verify promethus is run or not inside the kubernetes

kubectl patch svc monitoring-grafana -n monitoring -p '{"spec": {"type": "LoadBalancer"}}'
# above command is used for grafana expose through google load balancer

#kubectl port-forward svc/monitoring-grafana -n monitoring 3000:80  # direct expose through nodes

#get external ip through 
kubectl get svc -n monitoring

# In UI grafana website
username = admin
password get this below command

kubectl get secret monitoring-grafana -n monitoring -o jsonpath="{.data.admin-password}" | base64 --decode

Configure Prometheus to scrape frontend & backend app with mnitoring 
 frontend.yaml
 backend.yaml

kubectl apply -f frontend.yaml
kubectl apply -f backend.yaml

Prometheus must be allowed to watch all namespaces

helm upgrade monitoring prometheus-community/kube-prometheus-stack \
  -n monitoring \
  --set prometheus.prometheusSpec.serviceMonitorSelectorNilUsesHelmValues=false \
  --set prometheus.prometheusSpec.serviceMonitorNamespaceSelector.any=true



  
