param (
    [string]$buildCore = "false",
    [string]$buildCommunity = "false",
    [string]$buildApiGateway = "false"
)

Push-Location -Path ".."

Write-Host "Deleting Minikube"
minikube delete

Write-Host "Starting Minikube"
minikube start --driver=docker

Write-Host "Building Docker images"
if ($buildCore -eq "true") {
    docker build -t tudoraorban/sciencehub-backend-core:latest -f sciencehub-backend-core/Dockerfile .
}
if ($buildCommunity -eq "true") {
    docker build -t tudoraorban/sciencehub-backend-community:latest -f sciencehub-backend-community/Dockerfile .
}
if ($buildApiGateway -eq "true") {
    docker build -t tudoraorban/sciencehub-backend-api-gateway:latest -f sciencehub-backend-api-gateway/Dockerfile .
}

Write-Host "Applying configurations"
Push-Location -Path "sciencehub-backend-core"
kubectl create configmap postgresql-core-initdb --from-file=sciencehub_database.sql=database/sciencehub_database.sql

Push-Location -Path "../sciencehub-backend-community"
kubectl create configmap postgresql-community-initdb --from-file=sciencehub_community_database.sql=database/sciencehub_community_database.sql

Write-Host "Applying deployments"
Push-Location -Path "../kubernetes"
kubectl apply -f postgresql-core.yaml
kubectl apply -f postgresql-community.yaml
kubectl apply -f sciencehub-backend-core.yaml
kubectl apply -f sciencehub-backend-community.yaml
kubectl apply -f sciencehub-backend-api-gateway.yaml

# kubectl port-forward service/postgresql-core-service 5432:5432
# kubectl port-forward service/postgresql-community-service 5433:5433
# kubectl port-forward <api-gateway-pod-name> 8082:8082 

Pop-Location