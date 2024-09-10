Push-Location -Path ".."

Write-Host "Deleting Minikube"
minikube delete

Write-Host "Starting Minikube"
minikube start --driver=docker

Write-Host "Applying configurations"
Push-Location -Path "sciencehub-backend-core"
kubectl create configmap postgresql-core-initdb --from-file=sciencehub_database.sql=database/sciencehub_database.sql

Write-Host "Applying deployments"
Push-Location -Path "../kubernetes"
kubectl apply -f postgresql-core.yaml
kubectl apply -f sciencehub-backend-core.yaml
kubectl apply -f sciencehub-backend-community.yaml
kubectl apply -f sciencehub-backend-api-gateway.yaml

Pop-Location