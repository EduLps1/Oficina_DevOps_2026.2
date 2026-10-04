# Exemplos originais da oficina

Estes exemplos foram preparados para o ciclo 2026 do EPIC. São **pontos de partida didáticos**, não infraestrutura institucional pronta para operação permanente. Os estudantes devem compreender e alterar o código. Revisar permissões e custo no AWS Academy Learner Lab antes de aplicar.

| Exemplo | Uso principal | O que modificar |
| --- | --- | --- |
| [site-s3](site-s3/README.md) | Terraform, S3, variáveis, outputs e estado nas aulas 2–3 | Nome único de bucket, região, conteúdo da página e configuração de publicação quando autorizada |
| [flask-ec2](flask-ec2/README.md) | Docker, testes, CI, EC2 e operação nas aulas 5–8 | Mensagem/versão do serviço, teste, Dockerfile e Terraform inicial |

## Regras comuns

1. Executar `terraform plan` e ler a lista de recursos antes de confirmar `apply`.
2. Usar apenas credenciais temporárias fornecidas pelo laboratório autorizado; nunca salvar chaves em repositório, workflow ou material de aula.
3. Conferir saldo e política do Learner Lab antes de criar recursos; registrar identificadores para limpeza.
4. Executar `terraform destroy` após a prática e confirmar no console que os recursos não ficaram ativos.
5. Não versionar `terraform.tfstate`, arquivos `*.tfvars`, chaves SSH ou logs com dados sensíveis. O arquivo `.terraform.lock.hcl` pode ser versionado para fixar seleções do provider, conforme a [orientação do Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/aws-create).

O [guia operacional](../GUIA_OPERACIONAL.md) contém verificações e alternativas para bloqueios do laboratório.
