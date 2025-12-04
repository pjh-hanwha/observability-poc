helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
helm install istio-base istio/base -n istio-system --create-namespace

helm install istiod istio/istiod -n istio-system \
  --set pilot.resources.requests.cpu=200m \
  --set pilot.resources.requests.memory=512Mi \
  --set telemetry.enabled=true

#helm install istio-ingress istio/gateway -n istio-system

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.22/samples/addons/kiali.yaml -n istio-system
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.22/samples/addons/jaeger.yaml -n istio-system

