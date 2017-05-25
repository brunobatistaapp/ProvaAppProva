module AppProva
    module Pages
       class CadastrarAlunoPage < SitePrism::Page

            element :nome, '#user_name'
            element :email, '#user_email'
            element :senha, '#user_password'
            element :confirmarSenha, 'input[id=\'user_password_confirmation\']'
            element :cadastrar, 'input[value=\'Cadastrar\']'
            element :jatenhoCadastro, 'a[href=\'/users/sign_in\']'
            element :msgErro, 'span[class=\'help-inline\']'


             def preencherCadastro(person,senha,confirmarSenha)
                 self.nome.set person.name
                 self.email.set person.email
                 self.senha.set '123456'
                 self.confirmarSenha.set '123456'
                 self.cadastrar.click
             end

              def validarCadastro(nome,email,senha,confirmarSenha)
                 self.nome.set nome
                 self.email.set email
                 self.senha.set senha
                 self.confirmarSenha.set confirmarSenha
                 self.cadastrar.click
             end

             def jaCadastrado(email,senha)
                 self.jatenhoCadastro.click
                 self.email.set 'brunobatista101@gmail.com'
                 self.senha.set 'morato91'
             end
             
       end
    end
end