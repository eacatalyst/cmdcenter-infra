# https://www.virtualizationhowto.com/2022/06/kubernetes-install-metallb-loadbalancer/
# https://metallb.universe.tf/installation/

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-native.yaml

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.13.7/config/manifests/metallb-frr.yaml

kubectl create -f metallb-config.yaml

kubectl create -f metallb-advl2-config.yaml