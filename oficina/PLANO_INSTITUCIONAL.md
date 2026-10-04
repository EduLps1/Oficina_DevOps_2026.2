# Plano de oficina — DevOps: do código à operação na AWS

- **Programa:** EPIC — Engajar, Praticar, Integrar e Colaborar, UFT, campus de Palmas.
- **Área/subárea:** Computação / desenvolvimento, infraestrutura e automação.
- **Modelo:** oficina prática de capacitação e integração, nível introdutório com aplicações intermediárias.
- **Equipe confirmada:** Eduardo Lopes e Samuel Andrade; funções específicas por encontro a registrar antes do início.
- **Público:** estudantes a partir do 3º período com programação básica.
- **Modalidade/local previstos:** presencial, laboratório do EPIC; monitoria presencial ou online sob demanda.
- **Turmas previstas:** terça e quinta, 19h–21h; conteúdo equivalente, uma turma por aluno.
- **Período previsto:** 13/15 de outubro a 8/10 de dezembro de 2026, nove encontros por aluno.
- **Vagas:** estabelecer após verificar máquinas, contas AWS Academy e capacidade de acompanhamento.
- **Carga:** 18h presenciais; propostas de certificação de 20h e 40h descritas abaixo, condicionadas à coordenação.

## Justificativa e objetivo geral

A oficina será um espaço para os estudantes percorrerem, de forma orientada, as etapas que levam uma mudança de código até um serviço em funcionamento. Esse percurso permitirá discutir DevOps como uma prática de colaboração entre desenvolvimento e operação: as decisões tomadas ao escrever, revisar e testar o código também influenciam a publicação, a segurança, o custo e a manutenção do serviço. Ao documentar o que fizeram e explicar suas escolhas, os participantes poderão compartilhar o aprendizado com outras pessoas do EPIC.

Para tornar esse processo concreto, a turma trabalhará com aplicações pequenas e com recursos disponíveis no AWS Academy Learner Lab. Git registrará as mudanças; Terraform descreverá a infraestrutura; Docker reunirá a aplicação e suas dependências; e GitHub Actions apoiará a validação automatizada. A combinação dessas ferramentas permitirá observar cada etapa da entrega, reproduzi-la e identificar onde ocorreu uma falha, respeitando as permissões e os limites do laboratório.

Ao concluir a oficina, cada estudante deverá ser capaz de **explicar, executar e documentar** uma entrega pequena em AWS. Isso incluirá manter o código versionado, modificar e justificar uma configuração Terraform, demonstrar um alvo S3 ou EC2 funcional, verificar o resultado e remover os recursos criados para a atividade.

## Objetivos de aprendizagem

1. Explicar o fluxo de desenvolvimento, integração, entrega e operação e onde surgem riscos e responsabilidades.
2. Colaborar em repositório Git e interpretar uma mudança antes de incorporá-la.
3. Ler e modificar Terraform, interpretar `plan`, aplicar uma alteração autorizada e destruir os recursos do laboratório.
4. Reconhecer fundamentos de S3, EC2, portas e Security Groups necessários às práticas.
5. Construir e executar uma imagem Docker de aplicação simples e diferenciar imagem, contêiner e serviço.
6. Criar ou adaptar um workflow de GitHub Actions para testar e validar uma mudança.
7. Verificar disponibilidade, logs, credenciais e uso de recursos durante uma demonstração.
8. Comunicar decisões, limitações e resultados em repositório e apresentação.

## Conteúdo e método

O conteúdo será desenvolvido ao longo de nove encontros, conforme o [roadmap do ciclo](../PLANEJAMENTO_OFICINA_DEVOPS.md#roadmap) e os [roteiros de aula](ROTEIROS_DAS_AULAS.md). A sequência começará pela cultura DevOps e pelo uso de Git, passará pelo ciclo de vida do Terraform e pela publicação de um site simples em S3, e avançará para redes, EC2, Docker e GitHub Actions. Nos encontros finais, a turma integrará aplicação, contêiner e AWS, examinará saúde, logs, segurança e custos, e apresentará as entregas. Banco gerenciado poderá ser explorado como aprofundamento, se houver tempo e condições no laboratório.

Em cada encontro, serão reservados aproximadamente 30 a 40 minutos para fundamentos e discussão. Em seguida, a equipe conduzirá uma demonstração e uma prática orientada, encerrando com a análise do resultado e uma síntese do que foi aprendido. O site simples e a aplicação Flask servirão como exemplos comuns. Os estudantes receberão código Terraform inicial para modificar e deverão explicar o efeito de suas alterações, inclusive quando o acesso à AWS exigir uma alternativa local ou documental.

O projeto final será apresentado na quarta aula e seguirá em paralelo aos conteúdos da oficina até a entrega na nona. A quinta aula receberá as propostas curtas das equipes; a sexta e a oitava reservarão verificações breves de andamento. As dúvidas que exigirem mais tempo serão tratadas em monitorias solicitadas pelos estudantes, preservando o conteúdo previsto para cada encontro. Os [nove exercícios semanais](ATIVIDADES_SEMANAIS.md), por sua vez, serão independentes do projeto e comporão apenas a carga adicional proposta de 40h. Antes de indicar uso da AWS fora da aula, a equipe confirmará acesso, crédito, permissões e procedimento de destruição; quando isso não for possível, utilizará a alternativa local ou documental prevista no exercício.

## Infraestrutura e materiais

- Laboratório com computador por aluno ou dupla, navegador, internet, editor de código, Git e acesso ao GitHub.
- Contas AWS Academy Learner Lab habilitadas para a turma; permissões e saldo confirmados antes da aula 2.
- Terraform e Docker no laboratório ou alternativa preparada. A instalação e os serviços permitidos dependem do pré-voo.
- Repositórios de exemplo, material em Markdown, projeção e quadro; versão em texto dos diagramas e imagens.
- Reserva de sala, responsabilidade pelo uso, contatos de suporte e plano para falha de internet/laboratório.

Não assumir implantação pública permanente a partir do Learner Lab. Recursos de demonstração serão inventariados e destruídos ao término da prática. O projeto final pode produzir código aproveitável pelo EPIC após revisão separada.

## Inclusão e acessibilidade

Entregar instruções em texto pesquisável, comandos copiáveis e descrições para imagens; permitir trabalho individual ou em equipes de até três. Prever material pré-configurado e monitoria para quem enfrentar bloqueios de máquina, conectividade ou conhecimentos prévios. Avaliar objetivos técnicos e explicação, não a velocidade de digitação.

## Avaliação e evidências

- **Durante as aulas:** checkpoints práticos e registro de dificuldades; feedback formativo.
- **Projeto final:** repositório, README reproduzível, Terraform modificado, aplicação/site em um alvo AWS, evidência de `plan/apply/destroy`, demonstração e perguntas individuais. A [rubrica](PROJETO_FINAL.md#rubrica-de-avaliação) é comum às três portas de entrada.
- **Exercícios adicionais:** nove entregas independentes de 2h para a proposta de 40h, conferidas pela solução de referência e evidência requerida.
- **Avaliação do piloto:** diagnóstico inicial/final, presença, conclusão, satisfação, tempo real, dificuldades, recursos consumidos e sugestões para outra edição. Coletar apenas os dados necessários e divulgar resultados agregados.

## Certificação proposta

| Proposta | Evidência de carga | Requisitos de conclusão |
| --- | --- | --- |
| 20h | 18h presenciais + 2h adicionais de trabalho no projeto | Projeto final aprovado e presença mínima institucional |
| 40h | 18h presenciais + 9 exercícios de 2h + 2h de preparação adicional do projeto + 2h adicionais de trabalho no projeto | Projeto final aprovado, nove exercícios concluídos e presença mínima institucional |

Confirmar previamente com a coordenação a validade das duas cargas, e sua utilização como horas complementares, a presença mínima e o procedimento de emissão. Registrar separadamente aulas, exercícios, preparação, trabalho no projeto e monitoria para impedir dupla contagem.

## Validação e encerramento

Ao encerrar o ciclo, a equipe deverá guardar o plano efetivamente executado, os materiais utilizados, as listas de presença, as entregas cuja guarda tenha sido autorizada, as avaliações e um registro das dificuldades e recomendações para a próxima edição. Esses documentos ficarão em uma pasta interna com acesso adequado à natureza de cada dado. A biblioteca pública do EPIC poderá receber somente materiais didáticos liberados para divulgação, sem listas, avaliações individuais ou outros dados de participação.
