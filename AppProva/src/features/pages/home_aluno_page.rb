module AppProva
    module Pages
       class HomeAlunoPage < SitePrism::Page

             element :meuperfil, 'a[href=\'/users/edit\']'
             element :estatistica, 'a[class=\'general_statistics blocked\']'
             element :nome,'input[id=\'user_name\']'
             element :alterarCidade, 'a[class=\'btn btn-city\']'
             element :estado, 'select[name=\'estado_id\']'
             element :mg, 'option[value=\'11\']'
             element :cidade, 'select[name=\'cidade_id\']' 
             element :beloHorizonte, 'option[value=\'2686\']'
             element :buscarEscola, 'button[class=\'btn profile-choose-city-submit\']'
             element :b, :xpath, './/*[@id="s2id_user_enrollment_attributes_school_id"]/a/span[2]/b'
             element :escola, :xpath, './/label[text()="Escola"]/following-sibling::div/div/input'
             element :appEscola, :xpath, './/span[contains(text(), "Appprova - Belo Horizonte/MG")]'
             element :serie ,'select[id=\'user_enrollment_attributes_grade_id\']'
             element :fundamental, 'option[value=\'1\']'
             element :matricula, 'input[id=\'user_enrollment_attributes_external_id\']'
             element :salvar, 'button[id=\'btn-save-profile\']'
             element :sair, 'a[href=\'/users/destroy_session\']'
             element :msgSucesso, '#flash-message-box'
             element :fecharMsg, '.close'
             element :simulado, 'a[href=\'/mocks\']'
             element :afirmarsimulado, 'button[id=\'btn_start_mock\']'
             element :comecarSimulado, :xpath, './/*[@id="all_simulated-box"]/div/table/tbody/tr[1]/td[5]/div/button'
             element :questao, :xpath, './/*[contains(text(), "um instrumento que pode vir a ser controlado por um dado grupo.")]'
             element :responder, 'button[id=\'btn-simulated-answer-question\']'
             element :entregar,  'button[class=\'btn btn-simulated-finished action-btn question-btn-left\']'
             element :alterar, 'input[id=\'change_password\']'
             element :senha, '#user_password'
             element :confirmarSenha, '#user_password_confirmation'

             def fazerLogoutAluno()
                 self.sair.click
             end

             def terminarCadastro(nome,escola)
                 self.meuperfil.click
                 self.nome.set 'bruno batista'
                 self.alterarCidade.click
                 self.wait_for_estado
                 self.estado.click
                 self.mg.click
                 self.cidade.click
                 self.beloHorizonte.click
                 self.buscarEscola.click
                 page.execute_script "window.scrollBy(0,1000)"
                 self.escola.set 'Appprova - Belo Horizonte/MG'
                 self.appEscola.click
                 self.wait_for_serie
                 self.serie.click
                 self.fundamental.click
                 self.matricula.set '1234567'
                 self.salvar.click
            end

            def terminarCadastroIncompleto(nome,escola,matricula)
                self.meuperfil.click
                self.nome.set nome
                self.alterarCidade.click
                self.wait_for_estado
                self.estado.click
                self.mg.click
                self.cidade.click
                self.beloHorizonte.click
                self.buscarEscola.click
                page.execute_script "window.scrollBy(0,1000)"
                self.escola.set 'Appprova - Belo Horizonte/MG'
                self.appEscola.click
                self.wait_for_serie
                self.serie.click
                self.fundamental.click
                self.matricula.set matricula
                self.salvar.click
            end

            def alterarSenha(senha,confirmarSenha)
                self.meuperfil.click
                self.alterar.click
                self.senha.set '123456'
                self.confirmarSenha.set '123456'
                self.salvar.click
            end

            def alterarSenhaInvalida(senha,confirmarSenha)
                self.meuperfil.click
                self.alterar.click
                self.senha.set '12345'
                self.confirmarSenha.set '12345'
                self.salvar.click
            end

            def reponderSimulado()
                self.simulado.click
                self.comecarSimulado.click
                self.afirmarsimulado.click
                page.execute_script "window.scrollBy(0,1500)"
                self.questao.click
                self.responder.click
                self.entregar.click
            end

              def reponderSimuladoSemMarcarQuestao()
                self.simulado.click
                self.comecarSimulado.click
                self.afirmarsimulado.click
                page.execute_script "window.scrollBy(0,1500)"
                self.responder.click
                self.entregar.click
            end

            def reponderSimuladoDepoisDoTempo()
                self.simulado.click
                self.comecarSimulado.click
                self.afirmarsimulado.click
                sleep(90)
            end

       end
    end
end   