# https://medium.com/@vishalgarg652/setting-up-a-local-mlops-dev-environment-part-1-a8b468329819
# https://medium.com/mlearning-ai/setting-up-a-local-mlops-dev-environment-part-2-50ded3ecd447

# 1. Setup Default Storage Class
mkdir rook-single-node
cd rook-single-node
git clone --single-branch --branch release-1.5 https://github.com/rook/rook.git

cd rook/cluster/examples/kubernetes/ceph
kubectl create -f crds.yaml -f common.yaml -f operator.yaml

kubectl create -f cluster-test.yaml

kubectl -n rook-ceph get pod

# 2.0 Provision Storage Class
# change directory - rook/cluster/examples/kubernetes/ceph/csi/rbd
kubectl apply -f storageclass-test.yaml

# 3.0 Make the storage class as default
kubectl patch sc rook-ceph-block -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'

# 4.0
kubectl get sc

# Install Kubeflow
# Navigate to manifests directory
kubectl patch storageclass standard -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'

kubectl patch storageclass nfs-client -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
