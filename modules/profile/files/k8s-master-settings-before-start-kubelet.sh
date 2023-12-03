# kubelet will be dead if not doing this
swapoff -a && sed -i '/ swap / s/^/#/' /etc/fstab
systemctl daemon-reload
systemctl restart docker

# No need to start kubelet before kubeadm
#systemctl restart kubelet
# need to wait for about 10 mins, you will see kubelet start, before that you always see kubelet not starting by command 'service kubelet status'
# new update: it auto-restart: running -> dead() -> running
# service run command: /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf --config=/var/lib/kubelet/config.yaml
# before kubeadm, no files found

# remove containerd toml file
rm -f /etc/containerd/config.toml
systemctl restart containerd
