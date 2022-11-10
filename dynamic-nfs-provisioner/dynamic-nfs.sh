helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/
helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=nfs.cmdcenter.local \
    --set nfs.path=/K8sVolumes/olvm/ubsrv

helm install nfs-storage nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set nfs.server=nfs.cmdcenter.local \
    --set nfs.path=/exported/path

# Set Storage Class to Default
kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'


nfs.cmdcenter.local  192.168.50.201

echo 'nfs.cmdcenter.local  192.168.50.201' | sudo tee -a /etc/hosts