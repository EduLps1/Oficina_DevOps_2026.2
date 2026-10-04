# Projeto final: escolha, marcos e avaliação

O projeto final transforma os conceitos da oficina em uma entrega pequena e explicável. **A equipe escolhe e conduz o trabalho**, sem uma lista semanal obrigatória de tarefas do projeto. O EPIC sugere caminhos e oferece monitoria quando solicitada. O projeto é apresentado na aula 4, proposto na aula 5, acompanhado brevemente nas aulas 6 e 8 e demonstrado na aula 9.

## Três portas de entrada

1. **Projeto autoral:** a equipe traz uma aplicação ou ideia própria e define um recorte compatível com a oficina.
2. **Projeto-base:** a equipe evolui o site HTML/CSS/JS ou o exemplo Flask/Docker deste pacote, com mudança própria e infraestrutura explicada.
3. **Projeto sugerido pelo EPIC:** a equipe escolhe um dos briefs abaixo. O código pode ser entregue ao EPIC e fazer parte do portfólio dos alunos. Incorporar a solução a um serviço real depende de revisão e condições de operação posteriores.

Todas as portas têm a mesma rubrica. O trabalho pode ser individual ou em equipe de até três estudantes. O EPIC não exige que o serviço permaneça online após o uso temporário do Learner Lab.

## Briefs de projetos úteis ao EPIC

| Ideia | Problema que atende | Entrega mínima viável na oficina | Alvo AWS e extensão possível |
| --- | --- | --- | --- |
| **Catálogo de oficinas e projetos** | Informações sobre ações do EPIC podem precisar de um formato estruturado para futuros canais. | API Flask com `/health` e listagem de dados fictícios de oficinas/projetos; README, Terraform adaptado e demonstração. | EC2 + Docker; banco gerenciado somente como extensão. A equipe do EPIC decide depois se conecta ao site real. |
| **Laboratório reproduzível de DevOps** | Futuras oficinas se beneficiam de um ambiente inicial que outra equipe consiga criar e destruir. | Código Terraform parametrizado para um serviço demonstrativo, aplicação de exemplo, instruções de `plan/apply/destroy` e estimativa/controle de recursos. | EC2; Docker e CI como extensões. É um ativo diretamente reutilizável em outra edição. |
| **Verificador de disponibilidade** | O EPIC pode querer observar se seus serviços públicos respondem. | Pequena aplicação que consulta URLs públicas de demonstração e mostra estado, horário e erro sem coletar dados pessoais; endpoint `/health`. | EC2 + Docker; logs, alertas e painel como extensões. Usar alvos fictícios ou autorizados. |
| **Vitrine de projetos da comunidade** | Alunos e monitores podem precisar mostrar resultados de oficinas e projetos. | Página estática com dados fictícios ou autorizados, build/documentação e infraestrutura Terraform para publicação temporária. | S3; automação de publicação e integração futura ao site do EPIC como extensões. |
| **Inventário demonstrativo de laboratório** | O EPIC pode precisar experimentar uma forma de registrar recursos e manutenção. | API ou página com equipamento fictício, estado e instruções de uso; nenhum dado patrimonial real é exigido no piloto. | EC2 + Docker ou S3 para protótipo estático; persistência como extensão. |

**Priorização recomendada:** oferecer primeiro os três briefs mais alinhados à oficina — catálogo, laboratório reproduzível e verificador de disponibilidade. Os outros dois ampliam a escolha quando houver equipes suficientes. Cada brief deve ser confirmado com o EPIC antes de ser anunciado como possibilidade de incorporação real. O projeto do site institucional e a biblioteca educacional não são requisitos desta oficina.

## Mínimo técnico comum

- Repositório com histórico de mudanças e `README.md` contendo objetivo, arquitetura simples, pré-requisitos, comandos de teste/execução, implantação, verificação e limpeza.
- Código Terraform inicial **modificado pela equipe**; cada integrante consegue explicar ao menos uma decisão. Mostrar o resultado de `terraform fmt`, `validate`, `plan`, `apply` e `destroy` executados no Learner Lab ou em demonstração supervisionada. Não versionar `terraform.tfstate`, credenciais nem chaves.
- Um alvo AWS funcional: **S3 ou EC2**. A entrega deve ser testável durante a sessão ou comprovada por evidência sanitizada produzida antes da destruição. S3 público só quando a política do laboratório permitir; um bucket privado com objeto verificável atende ao objetivo de Terraform/S3 se publicação pública for bloqueada.
- Explicar custo/recurso utilizado, como verificar funcionamento e como remover o ambiente ao final.
- Demonstração da equipe e perguntas individuais na aula 9. Docker, GitHub Actions e banco são aprofundamentos possíveis no projeto; eles serão ensinados nas aulas mesmo quando a equipe escolher S3.

## Marcos sem substituir a aula

| Quando | Ação de projeto | Tempo em aula |
| --- | --- | --- |
| Aula 4 | Mostrar temas, mínimo e rubrica; formar equipes. | Até 15 min |
| Aula 5 | Entregar proposta de até uma página. | Até 15 min para coleta e retorno inicial |
| Aula 6 | Informar alvo, o que já foi testado e maior bloqueio. | Até 10 min no total; dúvidas longas seguem para monitoria |
| Aula 8 | Mostrar evidência de execução e pendências para a demo. | Até 10 min no total |
| Aula 9 | Entregar repositório e demonstrar; responder perguntas. | Conforme número de equipes |

**Modelo de proposta (aula 5):** título; integrantes; porta de entrada; problema/benefício; alvo S3 ou EC2; código-base escolhido; modificação Terraform pretendida; demonstração que comprovará funcionamento; risco de laboratório; ajuda necessária. Se a ideia não couber no tempo, os facilitadores orientam um recorte mínimo e registram a mudança, sem trocar o tema por conta própria.

## Rubrica de avaliação

| Critério | Pontos | Evidência observável |
| --- | ---: | --- |
| Terraform e ciclo de vida | 30 | Modificação compreendida, `fmt/validate/plan`, aplicação autorizada, estado entendido e destruição comprovada. |
| Alvo AWS funcional | 25 | Site/objeto S3 ou serviço EC2 verificável e relacionado ao problema proposto. |
| Reprodutibilidade, segurança e custo | 20 | Instruções executáveis, permissões e credenciais tratadas corretamente, recursos conferidos e limpos. |
| Git e documentação | 15 | Histórico compreensível, README suficiente para outra pessoa repetir o percurso e fontes atribuídas. |
| Demonstração e compreensão individual | 10 | Demonstração clara; cada integrante explica contribuição, decisão e limitação. |
| **Total** | **100** | |

**Aprovação pedagógica proposta:** 60/100, sem falta do alvo AWS funcional nem da demonstração de destruição. Este valor é uma proposta operacional e deve ser confirmado no plano da atividade antes da divulgação. Falha pontual do Learner Lab não reprova automaticamente a equipe quando houver código, `plan`, registros de tentativa e demonstração alternativa aceita pelos facilitadores; registrar a justificativa. Não usar quantidade de serviços ou gasto de crédito como vantagem na nota.

## Demonstração e autoria

Cada equipe recebe 5–7 minutos para mostrar problema, arquitetura, mudança Terraform, funcionamento, verificação e limpeza, seguidos de perguntas individuais. Se o número de equipes não couber nos 85 minutos previstos da aula 9, recolher vídeo curto antes do encontro e usar o tempo presencial para perguntas e checagens. A avaliação considera a entrega coletiva e a compreensão individual; contribuições podem ser vistas no histórico Git, proposta e explicações.

O repositório pode ser público se o grupo tiver direitos para publicar o conteúdo e retirar informações sensíveis. Se o EPIC desejar aproveitar um projeto, receberá código e documentação para revisão posterior. A autoria dos alunos deverá permanecer indicada conforme a política de publicação acordada para o projeto.
