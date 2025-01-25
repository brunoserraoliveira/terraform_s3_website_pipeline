# Terraform Pipeline

Este repositório contém uma pipeline de CI/CD para gerenciar a infraestrutura usando Terraform.

## Estrutura do Repositório

- `main.tf`: Arquivo principal do Terraform que define a infraestrutura.
- `.github/workflows/ci-cd.yml`: Arquivo de configuração do GitHub Actions para a pipeline de CI/CD.
- `.gitignore`: Arquivo para ignorar arquivos e diretórios específicos do Terraform.
- `s3_site.tf`: Arquivo Terraform que configura o bucket S3 para hospedar um site estático.

## Pré-requisitos

- Conta na AWS com credenciais configuradas.
- Repositório no GitHub.
- Terraform instalado localmente.

## Configuração

1. Clone este repositório:
   ```bash
   git clone https://github.com/seu-usuario/terraform-pipeline.git
   cd terraform-pipeline

## Created by 
   Bruno Oliveira