#encoding: utf-8

Quando(/^eu preencho o termino do cadastro$/) do
      homeAluno.terminarCadastro(@nome,@escola)
end

Então(/^eu verifico se realizei o cadastro\.$/) do
     expect(homeAluno.msgSucesso.text).to include 'Dados atualizados com sucesso! ×'
end

Quando(/^eu preencho o termino do cadastro "([^"]*)" e "([^"]*)" incompletos$/) do |nome, matricula|
      @nome = nome
      @matricula = matricula
      homeAluno.terminarCadastroIncompleto(@nome,@escola,@matricula)
end

Então(/^eu verifico os campos do cadastro "([^"]*)"\.$/) do |mensagem|
     expect(homeAluno.msgSucesso.text).to include mensagem
end

Quando(/^eu entro na home do usuario e troco a senha\.$/) do
      homeAluno.alterarSenha(@senha,@confirmarSenha)
end

Então(/^eu verifico se troquei a senha\.$/) do
     expect(page).to have_current_path('http://mobile.stg.appprova.com.br/users/sign_in', url: true)
end

Quando(/^eu entro na home do usuario e troco a senha invalida\.$/) do
  homeAluno.alterarSenhaInvalida(@senha,@confirmarSenha)
end

Então(/^eu verifico se troquei a senha invalida\.$/) do
  expect(homeAluno.msgSucesso.text).to include 'Não foi possível salvar usuário: Senha deve ter no mínimo 6 caracteres ×'
end