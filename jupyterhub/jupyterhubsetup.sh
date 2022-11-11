# https://www.youtube.com/watch?v=Da1qn7-RHvY

helm repo list

helm search repo

helm show values jupyterhub/jupyterhub > jupyterhub.yaml

helm install jupyterhub jupyterhub/jupyterhub --values jupyterhub.yaml --namespace jupyterhub --create-namespace