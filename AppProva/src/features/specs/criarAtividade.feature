#language: pt

Funcionalidade: Criar Atividade

@loginProf
Cenário: Criar uma atividade e salvar como rascunho.
Quando preencho os passos da atividade e salvar como rascunho.
Então verifico se a atividade foi criada.

Cenário: Criar uma atividade e publicar.
Quando preencho os passos da atividade e publicar.
Então verifico se a atividade foi publicada.

Cenário: Ir para o próximo passo sem botar o nome do simulado.
Quando nao preencho o nome do simulado e tento passar para o proximo passo.
Então verifico se a a mensagem da tela.

Cenário: Ir para o próximo passo sem conteúdo.
Quando nao preencho o conteúdo do simulado e tento passar para o proximo passo.
Então verifico se a a mensagem da tela de conteúdo.

Cenário: Ir para o próximo passo sem questão.
Quando nao preencho a questão do simulado e tento passar para o proximo passo.
Então verifico se a a mensagem da tela de questão.

Cenário: Publicar com a data igual ou menor que a atual.
Quando publico com a data igual ou menor que a atual.
Então verifico se o simulado não foi publicado.

Cenário: Apagar um simulado.
Quando eu salvo um simulado e depois apago.