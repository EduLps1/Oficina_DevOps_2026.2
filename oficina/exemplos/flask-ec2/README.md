# Laboratório: Flask, Docker, CI e EC2

Aplicação mínima para observar código, teste, imagem, contêiner, health check, rede e Terraform. Use dados fictícios. O servidor Flask embutido serve **somente para demonstração**; não é uma configuração de produção.

## Localmente

```text
python -m pip install -r requirements.txt
python -m unittest discover -s tests -v
python app.py
# em outro terminal: abrir http://localhost:5000/health
docker build -t epic-flask:lab .
docker run --rm -p 5000:5000 -e MESSAGE="Minha versão" epic-flask:lab
```

Altere `MESSAGE` e `APP_VERSION` para mostrar o que é configuração e o que exige rebuild. Consulte `docker logs` e pare o contêiner ao encerrar.

## Integração contínua

Em um repositório de exercícios cuja raiz contém este aplicativo e a pasta `terraform/`, copie `ci-exemplo.yml` para `.github/workflows/ci.yml`. O workflow executa teste Python, build Docker e validação Terraform. Ele **não cria recursos AWS**. Provocar um teste falho, observar o log e corrigi-lo é parte da aula 6.

## EC2 no Learner Lab

A pasta [`terraform/`](terraform/) é um modelo de infraestrutura inicial. Ela **reutiliza VPC e subnet existentes** do laboratório, que devem ser identificadas no pré-voo. Requer também AMI Amazon Linux 2023 válida na região, CIDR do operador, chave pública SSH e tipo de instância permitido. A configuração prepara Docker por `user_data`; não publica automaticamente o aplicativo.

1. Copiar `terraform/terraform.tfvars.example` para `terraform/terraform.tfvars` e substituir todos os campos de exemplo. Gerar uma chave SSH somente para o laboratório; manter a chave privada fora do repositório.
2. No diretório `terraform/`, rodar `init`, `fmt -check`, `validate` e `plan`. Pedir conferência do plano e do crédito antes de `apply`.
3. Após `apply`, aguardar `user_data` terminar; testar conexão SSH a partir do IP permitido. Copiar o aplicativo para a instância, construir a imagem e executar o contêiner mapeando a porta 5000. Abrir `http://IP_PUBLICO:5000/health` a partir da origem autorizada.
4. Examinar logs, mudar a versão, reconstruir e testar novamente. Encerrar contêiner e executar `terraform destroy`; conferir no console EC2, Security Group e key pair.

Os comandos concretos de SSH/SCP variam com terminal e caminho da chave. O facilitador deverá testar e registrar a variante que funciona nas máquinas da turma. Se o Learner Lab não oferecer VPC/subnet, AMI ou chave SSH utilizável, executar Docker localmente e discutir o plano EC2 com saídas sanitizadas; não prometer o laboratório EC2 sem esse pré-voo.

**Segurança:** a regra SSH e a porta 5000 aceitam apenas `operator_cidr`, normalmente o IP público do laboratório em formato `/32`. Nunca definir `0.0.0.0/0` para SSH, copiar a chave privada ao repositório ou guardar credenciais AWS no workflow.
