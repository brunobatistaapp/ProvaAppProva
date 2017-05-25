#encoding: utf-8

Quando(/^preencho os passos da atividade e salvar como rascunho\.$/) do 
      homeProf.criarSimuladoRascunho(@nome,@codigo)
end

Então(/^verifico se a atividade foi criada\.$/) do
     expect(homeProf.msgSucesso.text).to include 'Simulado salvo como rascunho!'
end

Quando(/^preencho os passos da atividade e publicar\.$/) do 
      homeProf.criarSimuladoPublicar(@nome,@codigo)
end

Então(/^verifico se a atividade foi publicada\.$/) do
     expect(homeProf.msgSucesso.text).to include 'Simulado publicado com sucesso.'
end

Quando(/^nao preencho o nome do simulado e tento passar para o proximo passo\.$/) do
      homeProf.criarSimuladoSemNome()
end

Então(/^verifico se a a mensagem da tela\.$/) do
     expect(homeProf.erro.text).to include 'não pode ficar em branco'
end

Quando(/^nao preencho o conteúdo do simulado e tento passar para o proximo passo\.$/) do
      homeProf.criarSimuladoSemConteudo(@nome)
end

Então(/^verifico se a a mensagem da tela de conteúdo\.$/) do
     expect(homeProf.msgErro.text).to include 'Selecione pelo menos um conteúdo para continuar.'
end

Quando(/^nao preencho a questão do simulado e tento passar para o proximo passo\.$/) do
      homeProf.criarSimuladoSemQuestao(@nome)
end

Então(/^verifico se a a mensagem da tela de questão\.$/) do
     expect(homeProf.msgErro.text).to include 'Seu simulado ainda não tem nenhuma questão!'
end

Quando(/^publico com a data igual ou menor que a atual\.$/) do
      homeProf.criarSimuladoComDataMenorOuIgual(@nome,@codigo)
end

Então(/^verifico se o simulado não foi publicado\.$/) do
     expect(homeProf.erroDataInicial.text).to include 'não pode ser menor que a data atual'
     expect(homeProf.erroDatafinal.text).to include 'não pode ser menor que a data atual, não pode ser menor que a data de início'
end

Quando(/^eu salvo um simulado e depois apago\.$/) do
      homeProf.criarSimuladoEApagar(@nome,@codigo)
end