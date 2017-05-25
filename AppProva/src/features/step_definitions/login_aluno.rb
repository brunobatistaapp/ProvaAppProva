#encoding: utf-8

Dado(/^que eu tenha um usuário de aluno$/) do |table|
    loginAluno.load
    @email = table.rows_hash['email']
    @senha = table.rows_hash['senha']
end

Quando(/^eu faço login$/) do
      loginAluno.fazerLoginAluno(@email,@senha)
end

Então(/^eu verifico se estou na área do aluno\.$/) do
     expect(homeAluno.msgSucesso.text).to include 'Login efetuado com sucesso. ×'
     homeAluno.fecharMsg.click
end

Quando(/^eu faço login com email"([^"]*)" ou senha"([^"]*)" errado\.$/) do |email, senha|
      @email = email
      @senha = senha
      loginAluno.fazerLoginAluno(@email,@senha)
end

Então(/^eu verifico a mensagem de erro"([^"]*)"\.$/) do |mensagem|
     expect(loginAluno.msgAlerta.text).to include mensagem
end

Quando(/^eu esqueco a senha e preencho o email$/) do
      loginAluno.load
      loginAluno.esqueceraSenha(@email)
end

Então(/^eu verifico se email foi enviado$/) do
     expect(page).to have_current_path('http://mobile.stg.appprova.com.br/users/sign_in', url: true)
end