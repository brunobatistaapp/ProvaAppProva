module AppProva
    module Pages
       class LoginProfPage < SitePrism::Page

            element :email,'#teacher_email'
            element :senha, '#teacher_password'
            element :lembrar, :xpath,'.//*[@id="new_teacher"]/p/label'
            element :entrar, 'input[value=\'Entrar\']'
            element :esquecer, 'a[href=\'/teachers/password/new\']'
            element :alerta, 'div[class=\'alert-messages\']'
            element :escola1, 'a[href=\'/set_school?school_id=1\']'
            element :cancelar, 'a[href=\'/teachers/sign_in\']'
            element :enviar, 'input[value=\'Enviar\']'
            element :msgEsquecer, 'div[class=\'modal-content\']'
            element :entendi, 'a[class=\'modal-action modal-close btn-flat primary-color\']'

            def fazerLoginProf(email,senha)
                self.email.set email
                self.senha.set senha
                self.lembrar.click
                self.entrar.click
            end

             def esquecerSenha(email)
                 self.esquecer.click
                 self.email.set 'qa@appprova.com.br'
                 self.enviar.click
            end
            
       end
    end
end    

