# Roteiros das nove aulas

**Uso:** Eduardo e Samuel ministram o mesmo roteiro nas turmas de terça e quinta. Antes de cada semana, registrar facilitador, monitor, laboratório, recursos e diferenças necessárias entre as turmas. Cada roteiro soma 120 minutos. Comandos completos e contingências estão no [guia operacional](GUIA_OPERACIONAL.md); o [projeto final](PROJETO_FINAL.md) acompanha a oficina sem substituir a ementa.

## Aula 1 — DevOps, fluxo de entrega e Git

- **Objetivo:** explicar por que colaboração e automação reduzem retrabalho; registrar uma mudança pequena em Git.
- **Teoria (35 min):** desenvolvimento e operações; mudança → revisão → teste → entrega → operação → feedback; diferença entre código local, repositório e serviço publicado. Mostrar que DevOps não é uma ferramenta isolada.
- **Demonstração (20 min):** `git status`, `add`, `commit`, `log`, `push` e uma revisão simples; percorrer o site de exemplo.
- **Laboratório (50 min):** diagnóstico curto de terminal/Git, criar ou clonar repositório de exercício, mudar título da página, registrar commit e explicar o histórico a um colega.
- **Síntese (15 min):** recolher dificuldade de ambiente, desenhar no quadro o caminho da mudança e apresentar a próxima aula.
- **Evidência:** URL ou captura do repositório e resposta breve sobre o que deve acontecer antes de publicar.
**Variação:** se Git local falhar, usar o editor web do repositório e registrar a limitação para monitoria.

## Aula 2 — AWS Academy e ciclo de Terraform

- **Objetivo:** distinguir código de infraestrutura e recurso criado; executar o ciclo Terraform sem perder controle de crédito.
- **Teoria (40 min):** conta/região, recurso, custo, permissões temporárias do Learner Lab, configuração declarativa, provider, recurso, estado; `init`, `fmt`, `validate`, `plan`, `apply`, `destroy`.
- **Demonstração (20 min):** iniciar sessão, verificar identidade/região e orçamento do laboratório; ler um `main.tf`; explicar cada linha do plano antes de aplicar.
- **Laboratório (45 min):** em uma cópia individual do exemplo S3, editar identificador/variável, rodar `terraform init`, `fmt`, `validate`, `plan`; `apply` e `destroy` somente após conferência de permissões e aprovação do facilitador.
- **Síntese (15 min):** discutir o que muda no estado antes/depois e conferir que não restaram recursos da aula.
- **Evidência:** diff do `.tf`, resumo do plano e registro da limpeza; não publicar credenciais nem arquivo de estado.
**Variação:** se o Learner Lab estiver indisponível, usar `fmt/validate` e plano de exemplo previamente sanitizado; concluir `apply/destroy` em monitoria ou aula seguinte.

## Aula 3 — S3, variáveis, outputs e estado

- **Objetivo:** relacionar objetos, bucket e endereço de website; modificar e publicar um site simples quando o laboratório permitir.
- **Teoria (35 min):** armazenamento de objetos, nomes globais, política de leitura pública, configuração de website, variáveis e outputs; por que o estado não deve ir ao Git.
- **Demonstração (20 min):** alterar o exemplo [site S3](exemplos/site-s3/README.md), mostrar o plano e explicar as condições para acesso público.
- **Laboratório (50 min):** trocar título/conteúdo da página; modificar uma variável Terraform; executar `plan`, aplicar sob supervisão, abrir URL se permitida, inspecionar objeto e destruir.
- **Síntese (15 min):** comparar `403`, `404` e erro de política; registrar a disponibilidade real do website no Learner Lab.
- **Evidência:** código, output ou resultado da verificação e registro de destruição.
**Variação:** se política pública de S3 for negada, manter bucket privado e verificar o objeto no console; a aprendizagem de Terraform e S3 continua, sem prometer uma URL pública.

## Aula 4 — Redes, Security Groups e EC2; abertura do projeto

- **Objetivo:** justificar uma regra de rede e reconhecer os componentes mínimos de uma instância.
- **Teoria (35 min):** IP, porta, HTTP, VPC, sub-rede, Security Group, entrada/saída; diferença entre liberar uma porta de aplicação e liberar administração.
- **Demonstração (15 min):** ler um Terraform inicial de EC2, identificar AMI, tipo, rede, `user_data`, regra HTTP e custo.
- **Laboratório (45 min):** completar diagrama de fluxo navegador → EC2 → aplicação; alterar uma regra ou variável do código inicial; prever o efeito no `plan`. Provisionar somente se o pré-voo confirmar região, quota e crédito.
- **Projeto (15 min):** apresentar três portas de entrada, mínimo técnico, rubrica e ideias do EPIC; formar equipes de 1 a 3 pessoas. Não usar esse momento para desenvolver o projeto.
- **Síntese (10 min):** responder dúvidas de escopo e indicar o formulário de proposta para a aula 5.
**Evidência:** diagrama anotado e mudança explicada no Terraform.

## Aula 5 — Docker, imagem e aplicação Flask

- **Objetivo:** distinguir imagem e contêiner; executar a mesma aplicação de modo reproduzível.
- **Teoria (35 min):** problema de ambientes diferentes; imagem, camadas, Dockerfile, porta, variável de ambiente e log; noções de usuário não-root e segredos.
- **Demonstração (20 min):** `docker build`, `docker run`, `docker ps`, `docker logs`, `docker stop`; acessar `/health` do [exemplo Flask](exemplos/flask-ec2/README.md).
- **Laboratório (50 min):** mudar mensagem da aplicação, rodar testes, construir imagem, iniciar contêiner e verificar resposta e logs; explicar qual mudança exige novo build.
- **Síntese e projeto (15 min):** receber proposta curta de cada equipe; devolver apenas ajustes de viabilidade e coerência com o alvo AWS.
- **Evidência:** Dockerfile, comando de execução, resposta de `/health` e proposta de projeto.
**Variação:** se Docker não estiver disponível nas máquinas, facilitador demonstra no ambiente preparado e participantes analisam Dockerfile e testes; monitoria recupera a execução prática.

## Aula 6 — GitHub Actions e integração contínua

- **Objetivo:** mostrar que uma mudança pode falhar ou passar por verificações automáticas antes da entrega.
- **Teoria (35 min):** evento, workflow, job, runner, teste, build e validação; diferença entre CI, entrega sob controle humano e implantação automática. Credenciais do Learner Lab não entram no repositório.
- **Demonstração (20 min):** copiar o [workflow de exemplo](exemplos/flask-ec2/ci-exemplo.yml) para `.github/workflows/ci.yml` de um repositório de exercício; provocar falha de teste e ler o log.
- **Laboratório (45 min):** corrigir a falha, abrir mudança revisável, confirmar teste, build Docker e validação Terraform. O CI não executa `terraform apply`.
- **Projeto (10 min):** pedir a cada equipe um status de um minuto: alvo, evidência já pronta e principal bloqueio. Direcionar aprofundamentos à monitoria.
- **Síntese (10 min):** cada participante explica qual verificação impediu uma mudança defeituosa.
**Evidência:** link para execução com falha e execução corrigida, ou captura sanitizada quando não houver acesso ao GitHub.

## Aula 7 — Integrar aplicação, contêiner e AWS

- **Objetivo:** executar uma publicação controlada e limpar o ambiente, entendendo cada etapa.
- **Teoria (35 min):** caminho código → testes → imagem → infraestrutura → aplicação; dependências entre recursos; publicação supervisionada, reversão e custo de ambiente ocioso.
- **Demonstração (20 min):** revisar `plan` do exemplo EC2; criar instância de demonstração autorizada, verificar Docker e mostrar publicação de contêiner; registrar identificador e custo estimado.
- **Laboratório (50 min):** em grupos, executar o roteiro de integração autorizado para o Learner Lab, testar endpoint/porta, modificar versão e comprovar a mudança; encerrar com `terraform destroy` e conferência no console.
- **Síntese (15 min):** reconstruir o fluxo no quadro e discutir como recuperar falha de publicação.
- **Evidência:** comandos/outputs sanitizados, endpoint testado e checklist de limpeza.
**Variação:** se o laboratório não suportar EC2 ou Docker na instância, executar contêiner local e analisar plano/diagrama AWS; registrar a limitação para não atribuir uso de serviço não realizado.

## Aula 8 — Saúde, logs, segurança e custos

- **Objetivo:** verificar se o serviço realmente funciona e responder a falha sem deixar recursos e credenciais expostos.
- **Teoria (35 min):** health check, logs, métricas básicas, princípio do menor acesso, segredo, custo, tags e destruição; banco gerenciado somente como extensão quando houver tempo, acesso e crédito.
- **Demonstração (15 min):** simular erro de configuração, consultar `/health` e logs do contêiner, localizar causa e mostrar a correção.
- **Laboratório (50 min):** investigar um cenário de falha com pistas; revisar Security Group, variáveis e registro de custos; documentar uma resposta curta.
- **Projeto (10 min):** segundo status de um minuto por equipe: prova de execução, pendência e plano de conclusão. Dúvidas longas seguem para monitoria.
- **Síntese (10 min):** definir o que deverá constar na demonstração final e confirmar recursos de aula destruídos.
**Evidência:** registro de incidente com sintoma, observação, causa, correção e prevenção.

## Aula 9 — Demonstração, perguntas e encerramento

- **Objetivo:** comprovar aprendizagem, registrar resultados e deixar o Learner Lab limpo.
- **Fundamento inicial (10 min):** critérios da demonstração e diferença entre evidência observada e afirmação da equipe.
- **Demonstrações (85 min):** cada equipe mostra repositório, alteração Terraform, `plan/apply/destroy` documentado, alvo AWS e funcionamento; cada integrante responde a uma pergunta. Usar 5–7 minutos por equipe e ajustar pela quantidade de equipes. Se exceder a capacidade da aula, recolher gravação curta antes do encontro e reservar tempo presencial para perguntas.
- **Limpeza e síntese (25 min):** conferir recursos no console e estado do Terraform; recolher autoavaliação, avaliação da oficina e recomendações.
**Evidência:** repositório, checklist da rubrica, perguntas individuais, registro de limpeza e formulários de avaliação.

## Continuidade

Os facilitadores registram, por turma, conteúdo realmente coberto, tempo gasto, dificuldades, adaptações e sugestões. Uma adaptação não deve alterar silenciosamente os requisitos de certificação ou a rubrica já divulgada. Materiais revisados e dados agregados alimentam a próxima edição e a biblioteca autorizada do EPIC.
