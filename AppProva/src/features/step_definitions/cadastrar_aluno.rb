#encoding: utf-8

Dado(/^que eu entro na tela de cadastro de aluno\.$/) do
    @person = OpenStruct.new
    @person.email = Faker::Internet.free_email
    @person.name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"
    loginAluno.load
    loginAluno.criarConta.click
end

Quando(/^faço o cadastro\.$/) do
      cadastrarAluno.preencherCadastro(@person,@senha,@confirmarSenha)
end

Então(/^verifico se o cadastro foi realizado\.$/) do
     expect(homeAluno.msgSucesso.text).to include 'Bem vindo! Você realizou seu registro com sucesso.'
end

Dado(/^que eu entro na tela de cadastro de aluno para verificar campos\.$/) do
    loginAluno.load
    loginAluno.criarConta.click
end

Quando(/^eu deixo os campos em branco nome"([^"]*)" email"([^"]*)" senha"([^"]*)"  confirmar senha"([^"]*)"\.$/) do |nome, email, senha, confirmarSenha|
      @nome = nome
      @email = email
      @senha = senha
      @confirmarSenha = confirmarSenha
      cadastrarAluno.validarCadastro(@nome, @email, @senha, @confirmarSenha)
end

Então(/^verifico as mensagens"([^"]*)" de alerta\.$/) do |mensagem|
     expect(cadastrarAluno.msgErro.text).to include mensagem
end

Dado(/^que eu entro na tela de cadastro de alunos\.$/) do
    loginAluno.load
    loginAluno.criarConta.click
end

Quando(/^eu já tenho cadastro eu faço login\.$/) do
      cadastrarAluno.jaCadastrado(@email,@senha)
      loginAluno.entrar.click
end

Então(/^verifico se o login foi realizado\.$/) do
     expect(homeAluno.msgSucesso.text).to include 'Login efetuado com sucesso. ×'
     homeAluno.fecharMsg.click
end