#language: pt

Funcionalidade: Responder simulado

-Eu como aluno
-Eu quero responder uma pergunta

@1 @loginAluno @logoutAluno
Cenário: Responder simulado.
Quando eu respondo o simulado
Então eu verifico se respondi o simulado com sucesso.

@loginAluno @logoutAluno
Cenário: Responder um simulado após o término do tempo disponível.
Quando eu respondo depois do tempo do simulado
Então eu verifico se a questao foi terminada.

@loginAluno @logoutAluno
Cenário: Responder uma pergunta sem marcar alternativa
Quando eu respondo o simulado se marcar a pergunta.
Então eu verifico se a questao foi finalizada.