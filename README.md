Run minikube before create images
eval $(minikube docker-env) - edd docker-deamon to minikube
docker build -t petshop-app:latest . 

For open in browser on WINDOWS:
kubectl port-forward --address 0.0.0.0 service/petshop-app-service 8080:80
Open new console (for test):
sudo netstat -tulnp | grep 8080
tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN      53690/kubectl

In browser:
http://192.168.0.101:8080
192.168.0.101 - IP VM
