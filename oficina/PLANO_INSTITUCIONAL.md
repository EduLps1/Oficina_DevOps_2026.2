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
**Carga:** 18h presenciais; propostas de certificação de 20h e 40h descritas abaixo, condicionadas à coordenação.

## Justificativa e objetivo geral

O EPIC pretende formar participantes que aprendam, pratiquem, documentem e possam multiplicar conhecimento. Nesta oficina, DevOps é abordado como colaboração e melhoria do percurso entre uma mudança no código e sua operação. A AWS Academy oferece um ambiente de experimentação; Terraform, Docker e GitHub Actions tornam o percurso observável e reproduzível.

Ao terminar, o estudante deverá conseguir **explicar, executar e documentar** uma entrega pequena em AWS, usando código versionado, uma alteração de infraestrutura em Terraform, um alvo S3 ou EC2 e um procedimento de verificação e limpeza.

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

Os nove encontros seguem o [roadmap do ciclo](../PLANEJAMENTO_OFICINA_DEVOPS.md#roadmap) e os [roteiros](ROTEIROS_DAS_AULAS.md). Cada aula combina 30–40 minutos de fundamento dialogado, demonstração, laboratório guiado, discussão de resultados e síntese. A turma trabalha com site HTML/CSS/JS em S3 e aplicação Flask em Docker/EC2. Código Terraform inicial será fornecido; o aluno deve modificá-lo e explicar a mudança. O projeto final é apresentado na aula 4, entregue na aula 9 e apoiado por monitoria sob demanda.

Os [exercícios semanais](ATIVIDADES_SEMANAIS.md) são independentes do projeto e destinam-se à carga adicional proposta de 40h. Quando uma atividade usar AWS fora da aula, o facilitador confirmará previamente acesso, crédito, permissões e procedimento de destruição; caso contrário, aplicará a variante local/documental prevista.

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

No encerramento, guardar plano executado, materiais, listas, entregas autorizadas, avaliações, dificuldades e recomendações na pasta interna de registros, com acesso restrito conforme a natureza dos dados. A biblioteca pública poderá receber apenas materiais didáticos liberados, sem dados de participação.
