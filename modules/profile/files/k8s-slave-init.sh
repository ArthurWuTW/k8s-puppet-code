kubeadm reset
systemctl enable docker
systemctl enable kubelet
systemctl daemon-reload
systemctl restart docker
systemctl stop kubelet
 rm -rf /etc/kubernetes/kubelet.conf /etc/kubernetes/pki/ca.crt
