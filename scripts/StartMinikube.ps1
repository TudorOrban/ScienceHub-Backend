param (
    [string]$buildCore = "true",
    [string]$buildCommunity = "true",
    [string]$buildApiGateway = "true"
)

Push-Location -Path ".."

Write-Host "Deleting Minikube"
minikube delete

Write-Host "Starting Minikube"
minikube start --driver=docker

Write-Host "Building Docker images"
if ($buildCore -eq "true") {
    Push-Location -Path "sciencehub-core"
    docker build -t tudoraorban/sciencehub-core:latest -f sciencehub-core/Dockerfile .
    Pop-Location
}
if ($buildCommunity -eq "true") {
    Push-Location -Path "sciencehub-community"
    docker build -t tudoraorban/sciencehub-community:latest -f sciencehub-community/Dockerfile .
    Pop-Location
}
if ($buildApiGateway -eq "true") {
    Push-Location -Path "sciencehub-api-gateway"
    docker build -t tudoraorban/sciencehub-api-gateway:latest -f sciencehub-api-gateway/Dockerfile .
    Pop-Location
}

Write-Host "Applying configurations"
Push-Location -Path "sciencehub-core"
kubectl create configmap postgresql-core-initdb --from-file=sciencehub_database.sql=database/sciencehub_database.sql

Push-Location -Path "../sciencehub-community"
kubectl create configmap postgresql-community-initdb --from-file=sciencehub_community_database.sql=database/sciencehub_community_database.sql

Write-Host "Applying deployments"
Push-Location -Path "../kubernetes"
kubectl apply -f postgresql-core.yaml
kubectl apply -f postgresql-community.yaml
kubectl apply -f sciencehub-core.yaml
kubectl apply -f sciencehub-community.yaml
kubectl apply -f sciencehub-api-gateway.yaml

# kubectl port-forward service/postgresql-core-service 5432:5432
# kubectl port-forward service/postgresql-community-service 5433:5433
# kubectl port-forward <api-gateway-pod-name> 8082:8082 

Pop-Location