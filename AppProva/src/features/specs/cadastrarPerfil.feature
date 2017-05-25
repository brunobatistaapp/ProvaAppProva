#language: pt

Funcionalidade: Cadastrar Perfil

-Eu como aluno
-Eu quero terminar realizar meu cadastro

@loginAluno @logoutAluno
Cenário:Cadastrar Perfil completo.
Quando eu preencho o termino do cadastro
Então eu verifico se realizei o cadastro.

@loginAluno @logoutAluno
Esquema do Cenário:Cadastrar Perfil incompleto.
Quando eu preencho o termino do cadastro <nome> e <matricula> incompletos
Então eu verifico os campos do cadastro <mensagem>.

Exemplos:
|nome   |matricula   |mensagem|
|"bruno"|"123"       |"Não foi possível salvar usuário: O campo Matrícula não está no formato correto"|
|""     |"12345678"  |"Dados atualizados com sucesso!"|
|"bruno"|"123456789" |"Dados atualizados com sucesso!"|
|"bruno"|""          |"Dados atualizados com sucesso!"|

@loginAluno2
Cenário:Trocar a senha.
Quando eu entro na home do usuario e troco a senha.
Então eu verifico se troquei a senha.

@loginAluno2 @logoutAluno
Cenário:Trocar a senha invalida.
Quando eu entro na home do usuario e troco a senha invalida.
Então eu verifico se troquei a senha invalida.



