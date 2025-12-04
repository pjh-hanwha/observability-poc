helm repo add cilium https://helm.cilium.io/
helm repo update


curl -L --remote-name https://github.com/cilium/cilium-cli/releases/latest/download/cilium-linux-amd64.tar.gz
tar xzf cilium-linux-amd64.tar.gz
sudo mv cilium /usr/local/bin/
rm -rf cilium-linux-amd64.tar.gz

# kubectl config view --minify -o jsonpath='{.clusters[0].cluster.server}'
# chainingMode
helm install cilium cilium/cilium \
  --namespace kube-system \
  --set cni.chainingMode=portmap \
  --set cni.exclusive=false \
  --set hubble.enabled=true \
  --set hubble.relay.enabled=true \
  --set hubble.ui.enabled=true \
  --set hubble.metrics.enabled='{dns,drop,tcp,flow,icmp,http}' \
  --set ipam.mode=cluster-pool \
  --set ipam.operator.clusterPoolIPv4PodCIDRList="{10.245.0.0/16}" \
  --set ipam.operator.clusterPoolIPv4MaskSize=24 \
  --set k8sServiceHost=192.168.0.88 \
  --set k8sServicePort=6443

# cilium status --verbose
