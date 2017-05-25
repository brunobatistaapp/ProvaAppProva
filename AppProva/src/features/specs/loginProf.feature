#language: pt

Funcionalidade: Login Professor

-Eu como Professor
-E fazer login

@logoutProf
Cenário:Fazer login com professor com sucesso.
Dado que eu tenha um usuário de professor
  |email|qa@appprova.com.br|
  |senha|loveqaatappprova  |
Quando eu faço login como professor
Então eu verifico se estou na área do professor.


Esquema do Cenário:Validar campo do email e senha
Quando eu faço login com email<email> ou senha<senha> errado na tela do professor.
Então eu verifico a mensagem de erro<mensagem> na tela do professor.

Exemplos:
 |email               |senha             |mensagem                    |
 |"qa@appprova.com"   |"loveqaatappprova"|"E-mail ou senha inválidos."|
 |"qa@appprova.com.br"|"loveqaatapppr"   |"E-mail ou senha inválidos."|
 |"qa@appprova.com.br"|""                |"E-mail ou senha inválidos."|
 |""                  |"loveqaatappprova"|"E-mail ou senha inválidos."|
 |""                  |""                |"E-mail ou senha inválidos."|

Cenário: Esquecer a senha.
Quando eu esqueco a senha do professor e preencho o email
Então eu verifico se email do professor foi enviado