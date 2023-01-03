# 12/20/2022
# https://docs.pingcap.com/tidb-in-kubernetes/dev/get-started

# 1. Validate connection to cluster
kubectl cluster-info

# 2. Deploy TiDB Operator
kubectl create -f https://raw.githubusercontent.com/pingcap/tidb-operator/master/manifests/crd.yaml

# 3. Add PingCap Helm Chart
helm repo add pingcap https://charts.pingcap.org/

# 4. Create namespace for TiDB Operator
kubectl create namespace tidb-admin

# 5. Install TiDB Operator
#helm install --namespace tidb-admin tidb-operator pingcap/tidb-operator --version v1.3.9
helm install --namespace tidb-admin tidb-operator pingcap/tidb-operator

# 6. Validate Pod Operators
kubectl get pods --namespace tidb-admin -l app.kubernetes.io/instance=tidb-operator

# 7. Deploy TiDB Cluster 
kubectl create namespace tidb-cluster && \
    kubectl -n tidb-cluster apply -f https://raw.githubusercontent.com/pingcap/tidb-operator/master/examples/basic/tidb-cluster.yaml

# 8. Deploy TiDB Dashboard
kubectl -n tidb-cluster apply -f https://raw.githubusercontent.com/pingcap/tidb-operator/master/examples/basic/tidb-dashboard.yaml

# 9. Deploy TiDB Monitoring 
kubectl -n tidb-cluster apply -f https://raw.githubusercontent.com/pingcap/tidb-operator/master/examples/basic/tidb-monitor.yaml

# 10. Validate Pod Status
watch kubectl get po -n tidb-cluster