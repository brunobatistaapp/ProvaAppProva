#encoding: utf-8

Quando(/^eu respondo o simulado$/) do
      homeAluno.reponderSimulado()
end

Então(/^eu verifico se respondi o simulado com sucesso\.$/) do
     expect(page.text).to include 'Resultado do Simulado'
end


Quando(/^eu respondo depois do tempo do simulado$/) do
      homeAluno.reponderSimuladoDepoisDoTempo()
end

Então(/^eu verifico se a questao foi terminada\.$/) do
    expect(page).to have_current_path('http://mobile.stg.appprova.com.br/mocks', url: true) 
end


Quando(/^eu respondo o simulado se marcar a pergunta\.$/) do
      homeAluno.reponderSimuladoSemMarcarQuestao()
end

Então(/^eu verifico se a questao foi finalizada\.$/) do
     expect(page.text).to include 'Corrija os seguintes erros para responder essa pergunta:'
     expect(page.text).to include 'Não está se esquecendo de nada? Marque uma alternativa antes de seguir para a próxima pergunta.'
end