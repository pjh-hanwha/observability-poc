helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
helm install promethous prometheus-community/kube-prometheus-stack -n promethous -f value.yaml
