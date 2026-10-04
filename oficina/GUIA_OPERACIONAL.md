# Guia operacional de facilitação e monitoria

Este guia acompanha o [plano institucional](PLANO_INSTITUCIONAL.md), os [roteiros](ROTEIROS_DAS_AULAS.md) e as [atividades](ATIVIDADES_SEMANAIS.md). Eduardo Lopes e Samuel Andrade devem distribuir, antes de cada semana, condução da turma de terça, condução da turma de quinta, monitoria, pré-voo e registros. As duas turmas recebem o mesmo objetivo, material e critério de conclusão.

## Antes da divulgação

- [ ] Coordenação confirma plano, calendário, vagas, presença mínima, proposta de 20h/40h, horas complementares e emissão de certificados.
- [ ] Laboratório e máquinas reservados para as nove terças e nove quintas; prever alternativa para feriado ou indisponibilidade.
- [ ] Definir quem abre e encerra o laboratório, quem responde por cada turma e quem consolida registros.
- [ ] Confirmar acessibilidade dos materiais, canal de comunicação, formulário de inscrição e meios de solicitar monitoria.
- [ ] Publicar pré-requisitos de programação básica, GitHub e laboratório; informar que uso de AWS Academy requer conta habilitada.
- [ ] Apresentar previamente critérios do projeto e das atividades adicionais, sem anunciar certificação ainda não confirmada.

## Pré-voo técnico do Learner Lab

Executar com **conta e permissões equivalentes às dos alunos**, antes da aula 2 e novamente antes das aulas 3, 4 e 7. Registrar data, região, responsável e resultado. Não usar uma conta pessoal para demonstrar uma capacidade que o Learner Lab não tem.

1. Confirmar convite, acesso, duração da sessão, saldo/crédito efetivo e painel de custo. Os US$ 50 lembrados da edição anterior são apenas hipótese até conferência nesta edição.
2. Confirmar região e serviços permitidos: S3, EC2, VPC, Security Group, AMI, logs e eventuais restrições de IAM. Testar tamanho de instância autorizado e quotas.
3. Verificar como o terminal do Learner Lab fornece credenciais temporárias. Não executar `aws configure` com chaves copiadas para repositório nem salvar chaves em materiais.
4. Executar `terraform init`, `fmt -check`, `validate` e `plan` nos exemplos. Aplicar apenas os recursos previstos, anotar tempo real e conferir `destroy` e console depois.
5. Testar separadamente publicação de website S3. A AWS exige permissões específicas para acesso público; se o laboratório bloquear política pública, usar bucket privado e inspeção de objeto como prática substituta. [Permissões de website S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteAccessPermissionsReqd.html).
6. Testar EC2, instalação/início do Docker, acesso HTTP, logs e destruição. Preparar saída/capturas sanitizadas de referência para falhas de laboratório.
7. Em máquina representativa da sala, testar Git, editor, Python, Terraform, Docker e conexão ao GitHub. O [workflow de CI](exemplos/flask-ec2/ci-exemplo.yml) não deve executar `terraform apply` com credenciais temporárias da Academy.
8. Definir um teto operacional por prática a partir do crédito real; conferir consumo antes e depois. Não criar RDS ou outro recurso opcional sem nova verificação de disponibilidade e custo.

**Comandos do ciclo** (no diretório do exemplo e apenas após configurar variáveis e credenciais temporárias do laboratório):

```text
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply       # revisar o plano e confirmar sob supervisão
terraform output
terraform destroy     # conferir o plano de destruição e confirmar
```

`terraform destroy` remove recursos que continuam no estado local; conferir também o console, porque um laboratório pode ter recursos criados fora desse estado. Não compartilhar o arquivo de estado para comprovar atividade. [Fluxo Terraform](https://developer.hashicorp.com/terraform/tutorials/cli/apply).

## Ritmo de cada aula

1. **Antes:** testar a prática inteira, preparar conta e código de recuperação, publicar objetivo e arquivo de trabalho.
2. **Abertura:** recuperar conceito anterior e expor resultado observável. Reservar 30–40 min totais a fundamentos e discussão.
3. **Demonstração:** verbalizar o motivo de cada comando e mostrar um erro frequente.
4. **Prática:** acompanhar dificuldades sem tomar o teclado do participante; registrar se o erro é de conceito, conta, rede, máquina ou material.
5. **Síntese:** pedir explicação curta do que mudou, indicar o exercício independente e a próxima aula.
6. **Fechamento:** inventariar recursos AWS, executar limpeza, registrar presença, tempo, resultados e dificuldades de cada turma.

## Monitoria sob demanda

O aluno solicita ajuda por canal definido pelo EPIC, informando turma, tema, erro reproduzível, passos tentados e disponibilidade. Eduardo ou Samuel oferece horário presencial ou online conforme capacidade e registra data, duração, tema, orientação e pendência, com acesso interno. Monitoria ajuda a compreender e depurar; não realiza o projeto pelo aluno. Se vários alunos tiverem a mesma dificuldade, produzir uma explicação reutilizável ou corrigir o material da aula seguinte. Horas de monitoria não se somam automaticamente à carga certificável do participante.

### Registro mínimo de monitoria

| Data | Turma | Equipe/aluno | Tema | Tentativas do aluno | Orientação | Próximo passo | Facilitador |
| --- | --- | --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |  |

## Registros internos e indicadores

Manter pasta interna separada da biblioteca educacional pública. Usar identificador de participante definido pela equipe, acesso restrito e somente informações necessárias. Para cada turma e encontro, registrar:

| Aula/data | Facilitador | Inscritos | Presentes | Checkpoint concluído | Tempo real | Falhas técnicas | Dúvidas recorrentes | Recursos AWS limpos? | Ajuste para próxima turma/edição |
| --- | --- | ---: | ---: | ---: | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |  |  |  |  |

No encerramento, consolidar participantes efetivos, frequência, conclusão, exercícios entregues, projetos aprovados, solicitações de monitoria, satisfação, materiais revisados e recursos consumidos. Distinguir planejado de realizado. Fotos/gravações somente conforme autorização institucional; não são requisito para avaliação técnica.

### Controle individual de carga e conclusão

Manter este controle em ferramenta interna com acesso restrito. Uma linha por participante; não publicar a planilha preenchida na biblioteca ou em repositório aberto. Marcar presença e cada exercício por identificador, não por horas estimadas lançadas automaticamente.

| ID | Turma | Aulas 1–9 presentes | Exercícios 1–9 aceitos | Preparação extra do projeto (2h) | Trabalho final extra (2h) | Nota do projeto | Faixa proposta | Conferência final |
| --- | --- | ---: | ---: | --- | --- | ---: | --- | --- |
|  |  |  |  |  |  |  |  |  |

**Regra de conferência:** 20h exige projeto aprovado, evidência das 2h adicionais e presença mínima confirmada; 40h acrescenta os nove exercícios e as 2h de preparação extra. Registrar devoluções e complementações. Uma monitoria não preenche automaticamente nenhuma dessas colunas.

### Diagnóstico inicial e avaliação final

Usar respostas curtas, sem nota eliminatória. No primeiro encontro: (1) qual é a função de Git? (2) já executou comandos em terminal? (3) o que significa publicar uma aplicação? (4) o que acredita ser um contêiner? (5) possui acesso a GitHub e Learner Lab? No último encontro, repetir os itens conceituais e perguntar qual etapa do fluxo consegue explicar e executar com autonomia. Para satisfação, pedir escala simples sobre clareza, ritmo, ambiente e monitoria, mais uma pergunta aberta: **qual atividade deve ser mantida, modificada ou retirada?**

## Gabarito orientador dos exercícios

O gabarito descreve **ideias a observar**; comandos equivalentes e justificativas corretas são aceitos.

| Semana | Resposta/evidência essencial | Erro frequente a devolver |
| --- | --- | --- |
| 1 | Fluxo inclui revisão/teste antes de entrega e operação/feedback depois; commits têm propósito legível. | Tratar `push` como publicação de serviço. |
| 2 | Variável altera entrada, output expõe resultado não sensível; `plan` é previsão e `apply` cria/altera. | Confundir `validate` com teste de permissões AWS ou versionar estado. |
| 3 | Bucket contém objetos; website exige configuração e leitura pública quando permitida; `403` indica falta de leitura e `404` objeto inexistente. | Assumir que website está público por padrão. |
| 4 | Regra de entrada abre apenas porta necessária e, quando possível, origem restrita; EC2 consome recurso enquanto ativa. | Liberar SSH/HTTP amplamente sem justificativa ou confundir IP e porta. |
| 5 | Imagem é artefato construído; contêiner é execução; nova alteração de código exige rebuild/restart; `/health` responde. | Expor segredo no Dockerfile ou achar que `docker build` inicia serviço. |
| 6 | Workflow em `push`/PR executa testes, Docker build e Terraform `fmt/validate`; falha impede conclusão bem-sucedida. | Colocar `terraform apply` automático com credenciais temporárias do laboratório. |
| 7 | Publicação prevê verificação e limpeza; se falhar, consultar logs/estado, corrigir e reexecutar com plano revisado. | Encerrar sem conferir `destroy` ou sem saber o que foi criado. |
| 8 | Relato separa sintoma, evidência, hipótese, teste, correção e prevenção; inclui custo/segredo pertinente. | Declarar causa sem evidência ou registrar credencial no log. |
| 9 | Comparativo distingue S3 para objeto/site estático e EC2/Docker para serviço em execução, com riscos de acesso, custo e operação. | Escolher mais serviços apenas por complexidade aparente. |

## Resposta a imprevistos

- **Sem internet ou GitHub:** demonstrar workflow/log previamente sanitizado e trabalhar em Git local; completar execução remota em monitoria quando voltar.
- **Sem Docker nas máquinas:** usar instância de demonstração autorizada ou analisar Dockerfile e logs; não registrar execução individual não realizada.
- **AWS indisponível ou crédito insuficiente:** usar `fmt/validate`, planos e outputs de referência; adiar `apply/destroy` supervisionados e registrar limitação. Não pedir conta paga pessoal ao aluno.
- **Ritmo mais lento:** manter objetivo mínimo da aula; reduzir extensão e oferecer monitoria. Não converter as aulas 7 ou 8 em revisão integral do projeto.
- **Equipes em número alto na aula 9:** solicitar vídeo curto antes do encontro e reservar aula para perguntas individuais e conferência de evidência.

## Fechamento e acervo

Conferir destruição por equipe, execução e rubrica; separar evidências de 20h e 40h sem dupla contagem. Produzir relatório curto com participação, aprendizagem observada, problemas, custos e recomendações. Guardar material reutilizável com título, autoria, versão, data, requisitos e condições de uso. A publicação na biblioteca do EPIC exige revisão de direitos e retirada de dados internos.
