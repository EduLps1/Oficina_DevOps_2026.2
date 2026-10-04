# Laboratório: site simples em S3 com Terraform

Este exemplo cria um bucket, envia `site/index.html` e configura website. **A publicação pública começa desligada.** Ative `enable_public_website` somente se o pré-voo confirmar que o Learner Lab e a conta permitem política pública para um bucket de demonstração sem dados pessoais. A [AWS explica que website S3 público exige ajustar Block Public Access e política de leitura](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteAccessPermissionsReqd.html); uma restrição da conta prevalece sobre a configuração do bucket.

## Preparação

1. Iniciar sessão no AWS Academy Learner Lab e usar o terminal/credenciais temporárias definidos pelo curso.
2. Copiar `terraform.tfvars.example` para `terraform.tfvars`. Informar região permitida e um nome de bucket globalmente único em minúsculas.
3. Confirmar crédito e verificar que nenhum arquivo de estado ou credencial será enviado ao Git.

## Prática supervisionada

```text
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
terraform output
terraform destroy
```

Antes de `apply` e de `destroy`, ler o plano e pedir conferência do facilitador. Com `enable_public_website = false`, o objeto existe em bucket privado e pode ser verificado no console. Se a publicação pública for autorizada, mudar para `true`, rodar novo `plan/apply` e abrir `website_url`. Não usar o bucket para guardar qualquer dado real. Depois de destruir, conferir o console e o saldo.

**Tarefa de modificação:** trocar título e texto em `site/index.html`, adicionar uma variável ou tag com explicação e comparar o plano antes/depois. Entregar apenas código, saída sanitizada e explicação; nunca `terraform.tfstate`.

## Falhas esperadas

- Nome do bucket já existe: escolher outro nome globalmente único.
- `AccessDenied` ao aplicar política pública: manter o bucket privado; registrar que o laboratório não permite a publicação pública.
- Website retorna `403`: falta leitura pública; `404`: objeto solicitado não existe. A atividade de Terraform continua válida com o bucket privado.

Este código foi escrito para o ambiente de laboratório e precisa ser testado na conta AWS Academy efetivamente usada pela turma.
