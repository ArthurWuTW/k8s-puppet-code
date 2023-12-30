kubeadm init \
  --image-repository registry.aliyuncs.com/google_containers \
  --service-cidr=10.96.0.0/12 \
  --pod-network-cidr=10.244.0.0/16
  # --apiserver-advertise-address=172.20.10.6 \

export KUBECONFIG=/etc/kubernetes/admin.conf
echo 'export KUBECONFIG=/etc/kubernetes/admin.conf' >> ~/.bashrc

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

# Install ingress(Fix) only v1.0.4 set hostNetwork=true works, v1.0.5 failed
kubectl apply -f /root/ingress-nginx-controller-deployment-fix_v1_0_4.yaml
