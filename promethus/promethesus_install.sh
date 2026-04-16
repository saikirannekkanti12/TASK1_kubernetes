# Add repo
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts

# Update
helm repo update

# Create namespace
kubectl create namespace monitoring

# Install
helm install monitoring prometheus-community/kube-prometheus-stack -n monitoring
