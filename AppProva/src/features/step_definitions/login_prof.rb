#encoding: utf-8

Dado(/^que eu tenha um usuário de professor$/) do |table|
    visit 'http://professor.mobile.stg.appprova.com.br/teachers/sign_in'
    @email = table.rows_hash['email']
    @senha = table.rows_hash['senha']
end

Quando(/^eu faço login como professor$/) do
      loginProf.fazerLoginProf(@email,@senha)
end

Então(/^eu verifico se estou na área do professor\.$/) do
     expect(page).to have_current_path('http://professor.mobile.stg.appprova.com.br/', url: true)
     expect(homeProf.msgSucesso.text).to include 'Login efetuado com sucesso.'  
end


Quando(/^eu faço login com email"([^"]*)" ou senha"([^"]*)" errado na tela do professor\.$/) do |email, senha|
      visit 'http://professor.mobile.stg.appprova.com.br/teachers/sign_in'
      @email = email
      @senha = senha
      loginProf.fazerLoginProf(@email,@senha)
end

Então(/^eu verifico a mensagem de erro"([^"]*)" na tela do professor\.$/) do |mensagem|
     loginProf.wait_for_alerta  
     expect(loginProf.alerta.text).to include mensagem
end

Quando(/^eu esqueco a senha do professor e preencho o email$/) do
      visit 'http://professor.mobile.stg.appprova.com.br/teachers/sign_in'
      loginProf.esquecerSenha(@email)
end

Então(/^eu verifico se email do professor foi enviado$/) do
     expect(loginProf.msgEsquecer.text).to include 'Dentro de minutos, você receberá um e-mail com instruções para a troca da sua senha.'
     loginProf.entendi.click
end
 