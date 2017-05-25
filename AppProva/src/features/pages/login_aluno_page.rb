module AppProva
    module Pages
       class LoginAlunoPage < SitePrism::Page

             set_url '/'
             element :email, '#user_email'
             element :senha, '#user_password'
             element :entrar, 'input[value=\'Entrar\']'
             element :criarConta, 'a[href=\'/users/sign_up\']'
             element :esquecerSenha, 'a[href=\'/users/password/new\']'
             element :manterLogado, '#user_remember_me'
             element :msgAlerta, '.alert'
             element :recuperar, 'input[name=\'commit\']'

             def fazerLoginAluno(email, senha)
                 self.email.set email
                 self.senha.set senha
                 self.entrar.click
             end

             def esqueceraSenha(email)
                 self.esquecerSenha.click
                 self.email.set 'bruno@gmail.com'
                 self.recuperar.click
             end
 
       end
    end
end   