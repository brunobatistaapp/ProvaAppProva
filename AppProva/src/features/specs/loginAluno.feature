#language: pt

Funcionalidade: Login Aluno

-Eu como aluno
-Eu quero realizar meu cadastro
-E fazer login

@logoutAluno
Cenário:Fazer login com sucesso.
Dado que eu tenha um usuário de aluno
  | email | brunobatista101@gmail.com |
  | senha |     morato91              |
Quando eu faço login
Então eu verifico se estou na área do aluno.

Esquema do Cenário:Validar campo do email e senha
Quando eu faço login com email<email> ou senha<senha> errado.
Então eu verifico a mensagem de erro<mensagem>.

Exemplos:
 |email                      |senha     |mensagem                   |
 |"brunobatista@gmail.com"   |"morato91"|"Email ou senha inválidos."|
 |"brunobatista101@gmail.com"|"morato"  |"Email ou senha inválidos."|
 |"brunobatista101@gmail.com"|""        |"Email ou senha inválidos."|
 |""                         |"morato"  |"Email ou senha inválidos."|
 |""                         |""        |"Email ou senha inválidos."|

Cenário: Esquecer a senha.
Quando eu esqueco a senha e preencho o email
Então eu verifico se email foi enviado
