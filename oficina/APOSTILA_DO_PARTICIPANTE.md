# Oficina DevOps do EPIC — guia do participante

Este guia acompanha as nove aulas. Cada seção explica o conceito que será discutido, indica uma experiência curta e registra o que o participante deve saber explicar ao final. Os comandos são exemplos: use somente o ambiente e os recursos liberados pela equipe da oficina. Antes de criar recursos AWS, confira a região, o crédito e as permissões do Learner Lab; ao terminar, confirme a limpeza.

## 1. Da mudança ao serviço: DevOps e Git

DevOps reúne práticas de colaboração entre quem desenvolve e quem opera um serviço. Uma entrega confiável passa por uma mudança identificável, revisão, testes, publicação, observação do comportamento e correção a partir do retorno. A automação ajuda a repetir etapas, mas não substitui a decisão humana sobre o que publicar.

Git registra versões do código. O *working tree* contém alterações locais; o *stage* seleciona o que entrará no próximo commit; o commit registra uma versão com mensagem. O repositório remoto permite compartilhar e revisar. Antes de publicar, deve ser possível responder: **o que mudou, por que mudou e como foi verificado?**

```bash
git status
git add site/index.html
git commit -m "Atualiza titulo do site de exemplo"
git log --oneline -3
```

**Experiência da aula:** alterar uma frase de uma página, registrar a mudança e mostrar o histórico. **Ao final, explique:** por que um commit pequeno e identificável facilita a revisão e a recuperação de falhas.

## 2. Infraestrutura como código e custo

Na AWS, uma configuração cria recursos em uma conta e região. O Learner Lab tem acesso e duração específicos; ver um exemplo funcionando em outra conta não garante que o mesmo serviço esteja liberado aqui. Todo recurso criado deve ter propósito, responsável e plano de limpeza.

Terraform descreve o estado desejado em arquivos `.tf`. `init` prepara o diretório e baixa providers; `fmt` padroniza o código; `validate` verifica a estrutura; `plan` mostra diferenças previstas; `apply` solicita as mudanças; `destroy` remove os recursos descritos. Um plano **deve ser lido**: verifique endereço, quantidade e tipo de recursos antes de aplicar.

```bash
terraform init
terraform fmt -check
terraform validate
terraform plan
# apply e destroy: somente no laboratório liberado e sob orientação
```

O arquivo de estado relaciona o código aos recursos criados. Ele pode conter informações sensíveis e não deve entrar no Git. Credenciais, chaves privadas, `.tfvars` pessoais e saídas com segredos também ficam fora do repositório. Para o exercício, use uma cópia individual do [exemplo S3](exemplos/site-s3/README.md).

**Experiência da aula:** alterar uma variável e explicar a diferença que aparece no `plan`. **Ao final, explique:** a diferença entre validar um arquivo, prever uma mudança e efetivamente criar um recurso.

## 3. S3, variáveis, outputs e estado

S3 armazena **objetos** em um **bucket**. O nome do bucket precisa ser único no espaço do serviço; por isso o exemplo recebe um nome por variável. Um site estático pode ser composto por `index.html` e outros arquivos. Guardar o objeto no bucket e torná-lo público são decisões diferentes. A leitura pública depende das políticas da conta e do bucket; quando não for permitida, o exercício pode verificar o objeto em um bucket privado.

Variáveis recebem valores de entrada, como nome e região. Outputs apresentam informações úteis após a aplicação, como nome de bucket ou endereço do site. O estado não é um output para divulgação: ele é um registro interno da infraestrutura.

```bash
cd oficina/exemplos/site-s3
terraform init
terraform plan -var-file=terraform.tfvars
```

Copie `terraform.tfvars.example` para `terraform.tfvars` e edite valores próprios antes do comando. Consulte o [README do exemplo](exemplos/site-s3/README.md) para restrições de publicação e limpeza. Um `403` indica que o acesso foi negado; um `404` sugere objeto ou caminho ausente; um erro no `apply` pode apontar permissão ou política do laboratório. Registre a mensagem real antes de tentar uma correção.

**Experiência da aula:** modificar conteúdo e variável, prever a mudança, observar o objeto ou URL quando autorizada e destruir os recursos. **Ao final, explique:** como variável, recurso, objeto e output se relacionam.

## 4. Rede, Security Group e EC2

Uma instância EC2 executa um sistema operacional em uma rede. A VPC e a sub-rede determinam onde ela fica; um endereço permite alcançá-la; uma porta identifica o serviço acessado. Um **Security Group** filtra tráfego de entrada e saída. Abrir uma porta é uma escolha específica: a porta da aplicação não deve ser confundida com a porta de administração.

Antes de criar uma instância, desenhe o caminho `navegador → endereço da instância → regra de entrada → porta da aplicação`. Revise AMI, tipo de instância, região, regra de entrada, `user_data` e custo esperado. O [exemplo EC2](exemplos/flask-ec2/README.md) restringe as portas ao CIDR do operador e usa o código inicial para mostrar a estrutura; ajuste conforme a rede real do laboratório.

**Experiência da aula:** alterar uma regra ou variável e explicar o efeito esperado no `plan`. **Ao final, explique:** qual pacote precisa chegar à instância e qual regra o permite. Nesta aula, conheça as [opções de projeto final](PROJETO_FINAL.md) e forme sua equipe.

## 5. Aplicação Flask e contêiner Docker

Uma **imagem** é o pacote construído a partir do Dockerfile; um **contêiner** é uma execução dessa imagem. O Dockerfile registra dependências, arquivos e comando de inicialização. Mapear portas conecta a porta do host à porta em que a aplicação escuta dentro do contêiner. Variáveis de ambiente podem alterar configuração sem editar o código; segredos reais não devem ser fixados na imagem.

O exemplo [Flask/Docker](exemplos/flask-ec2/README.md) tem página inicial e endpoint `/health`. A resposta de saúde é uma evidência pequena de que o processo atende requisições; ela não comprova, sozinha, que todas as funções do serviço estão corretas.

```bash
docker build -t epic-flask .
docker run --rm -p 5000:5000 epic-flask
# em outro terminal:
curl http://localhost:5000/health
```

**Experiência da aula:** mudar a mensagem, executar os testes, reconstruir a imagem e consultar `/health` e logs. **Ao final, explique:** por que mudar o código exige uma nova imagem para reproduzir a versão publicada. Entregue a proposta curta do projeto nesta semana.

## 6. GitHub Actions e validação automática

Um workflow é disparado por um evento do repositório e contém jobs executados por runners. Testes verificam comportamento; o build verifica se a imagem pode ser construída; `terraform fmt` e `validate` verificam o código de infraestrutura. Uma falha no CI indica **qual verificação** falhou, não necessariamente toda a causa. Leia o log e reproduza o problema localmente quando possível.

Copie [`ci-exemplo.yml`](exemplos/flask-ec2/ci-exemplo.yml) para `.github/workflows/ci.yml` no repositório de exercício. O workflow não executa `terraform apply` e não precisa de credenciais AWS. Colocar credenciais temporárias do Learner Lab em commits ou logs expõe a conta e dificulta a limpeza.

**Experiência da aula:** provocar uma falha simples, localizar a etapa, corrigir e registrar as duas execuções. **Ao final, explique:** o que foi verificado automaticamente e o que ainda depende de revisão humana. A aula reserva uma verificação curta do projeto; dúvidas extensas seguem para a monitoria.

## 7. Da aplicação ao ambiente AWS

A publicação integra quatro partes: **código testado → imagem identificável → infraestrutura prevista → execução e verificação**. A ordem importa: uma aplicação não responderá se a instância ou a regra de entrada estiver incorreta. Antes de aplicar, confirme que o plano usa somente recursos autorizados. Depois de iniciar, verifique o processo, a porta e o endpoint; se falhar, observe logs e configuração antes de repetir comandos.

No roteiro supervisionado, a turma executa uma mudança pequena, comprova qual versão está no ar e destrói o ambiente. Um repositório reproduzível deve conter instruções de criação, teste e limpeza. O [README do exemplo EC2](exemplos/flask-ec2/README.md) reúne os passos; a equipe pode adaptar o caminho à disponibilidade real do Learner Lab.

**Experiência da aula:** publicar, testar e destruir em grupo quando o laboratório permitir. **Ao final, explique:** quais evidências mostram que houve publicação e quais mostram que os recursos foram removidos. A aula mantém seu conteúdo próprio; usar o aprendizado no projeto é uma escolha da equipe.

## 8. Saúde, logs, segurança e custos

Um serviço pode estar criado e ainda não funcionar. Um **health check** responde se um caminho essencial está disponível. Logs ajudam a entender eventos e falhas; observação de custo e recursos mostra o que continua consumindo crédito. Investigue nesta ordem: sintoma, observação verificável, hipótese, teste, correção e prevenção.

Revise as portas abertas no Security Group, quem tem acesso às credenciais, quais recursos seguem ativos e o que será destruído. Registre o identificador do recurso antes de limpar. Banco gerenciado é aprofundamento opcional, condicionado a tempo, acesso e crédito; não entra no mínimo comum do projeto.

**Experiência da aula:** resolver um incidente simulado e escrever um registro de cinco linhas: sintoma, evidência, causa, correção, prevenção. **Ao final, explique:** por que um `200` em `/health`, um log e uma inspeção do ambiente respondem a perguntas diferentes. Haverá a segunda verificação curta do projeto.

## 9. Demonstração e fechamento

Apresente o repositório, a decisão de arquitetura, a mudança em Terraform, a evidência de `plan/apply/destroy`, o alvo AWS usado e o funcionamento do artefato. Cada integrante deve explicar uma parte e responder a uma pergunta individual. Se o laboratório não permitir manter o serviço ativo até a apresentação, use evidências sanitizadas e mostre a reprodução possível naquele momento.

Ao encerrar, confirme a remoção de recursos no Terraform **e** no console da conta. Registre limitações técnicas encontradas e sugestões para a próxima edição. O código de um projeto útil ao EPIC pode ser reaproveitado depois de revisão, mas a oficina não exige um serviço permanente no ambiente temporário.

## Consulta rápida

- [Roteiros das aulas](ROTEIROS_DAS_AULAS.md): tempos e atividades presenciais.
- [Exercícios semanais](ATIVIDADES_SEMANAIS.md): práticas independentes de 2h da proposta de 40h.
- [Projeto final](PROJETO_FINAL.md): opções, critérios e entregas.
- [Exemplos técnicos](exemplos/README.md): código e instruções.

**Regra de trabalho:** uma evidência deve permitir a outra pessoa entender o que foi feito, verificar o resultado e saber como limpar ou refazer o ambiente.
