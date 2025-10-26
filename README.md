# Infra Prova Pratica

Projeto entregue para a disciplina Infraestrutura de TI — API Flask containerizada e orquestrada.

## Como executar (local)

1. Entrar na pasta `api` e construir a imagem Docker:
   ```bash
   cd api
   docker build -t infra-prova-api:latest .
   docker run --rm -p 5000:5000 infra-prova-api:latest
   ```

2. Testar endpoints:
   ```bash
   curl http://localhost:5000/
   curl -X POST http://localhost:5000/sum -H "Content-Type: application/json" -d '{"a":3,"b":4.5}'
   ```

## Kubernetes (minikube / kind)

- Carregue a imagem no cluster:
  - Minikube: `minikube image load infra-prova-api:latest`
  - Kind: `kind load docker-image infra-prova-api:latest --name <cluster-name>`

- Aplicar manifests:
  ```bash
  kubectl apply -f k8s/deployment.yaml
  kubectl apply -f k8s/service.yaml
  ```

- Descobrir URL:
  - `minikube service infra-prova-api-svc --url` ou `kubectl port-forward deployment/infra-prova-api 5000:5000`

## Terraform

1. Ajuste `terraform/variables.tf` se quiser um bucket específico.
2. `cd terraform`
3. `terraform init` e `terraform apply -auto-approve`

Se não houver AWS disponível, use LocalStack e ajuste o provider para apontar os endpoints locais.
