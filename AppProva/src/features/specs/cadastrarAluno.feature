#language: pt

Funcionalidade: Cadastrar Aluno

@logoutAluno
Cenário: Cadastrar aluno com sucesso.
Dado que eu entro na tela de cadastro de aluno.
Quando faço o cadastro.
Então verifico se o cadastro foi realizado.

Esquema do Cenário: Verificar campos de cadastro de aluno.
Dado que eu entro na tela de cadastro de aluno para verificar campos.
Quando eu deixo os campos em branco nome<nome> email<email> senha<senha>  confirmar senha<confirmarSenha>.
Então verifico as mensagens<mensagem> de alerta.

Exemplos:
|nome   |email             |senha   |confirmarSenha|mensagem|
|"bruno"|""                |"123456"|"123456"      |"não pode ficar em branco"            |
|"bruno"|"bruno@gmail.com" |"123456"|"123456"      |"já está em uso"                      |
|"bruno"|"bruno@"          |"123456"|"123456"      |"com formato inválido"                |
|"bruno"|"brunob@gmail.com"|"12345" |"12345"       |"deve ter no mínimo 6 caracteres"     |
|"bruno"|"brunob@gmail.com" |"123456"|"12345"      |"não está de acordo com a confirmação"|

@logoutAluno
Cenário: Fazer login através do link de ja tenho cadastro.
Dado que eu entro na tela de cadastro de alunos.
Quando eu já tenho cadastro eu faço login.
Então verifico se o login foi realizado.