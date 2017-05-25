module AppProva
    module Pages
       class HomeProfPage < SitePrism::Page

            element :simulado, 'a[id=\'sidebar-mocks\']'
            element :novoSimulado, 'a[href=\'/activities/new\']'
            element :nomeSimulado, 'input[id=\'mock_name\']'
            element :proximo, 'a[id=\'wizard-form__submit-button\']'
            element :tecnologia, 'li[data-subgroup-id=\'29\']'
            element :internet, 'label[for=\'tag-1295\']'
            element :proximo2, :xpath, 'html/body/footer/div[2]/a'
            element :ano, :xpath, './/*[@id="questions-search"]/div[1]/div/span/span[1]/span/ul/li/input'
            element :dataAno, :xpath, './/ul/li[contains(text(), "2009")]'
            element :dificuldade, :xpath, './/*[@id="questions-search"]/div[2]/div/span/span[1]/span/ul/li/input'
            element :media, :xpath, './/span//ul/li[contains(text(), "Média")]'
            element :fonte, :xpath, './/*[@id="questions-search"]/div[3]/div/span/span[1]/span/ul/li/input'
            element :nomeFonte, :xpath, './/ul/li[contains(text(), "UFMG")]'
            element :habilidade, :xpath, './/*[@id="questions-search"]/div[4]/div/span/span[1]/span/ul/li/input'
            element :nomeHabilidade, :xpath, './/span//ul/li[contains(text(), "H29 - Identificar pela análise de suas linguagens, as tecnologias da comunicação e informação.")]'
            element :enen, :xpath, './/*[@id="select2-enem_eq-container"]'
            element :nomeEnen,:xpath, './/span//ul/li[contains(text(), "Não")]'
            element :codigo, 'input[id=\'codigo\']'
            element :limparFiltro, 'button[id=\'reset-form\']'
            element :buscar, 'button[type=\'submit\']'
            element :adicionarQuestao, :xpath, './/*[contains(text(), "Adicionar Questão")]'
            element :proximo3, :xpath, 'html/body/footer/div[2]/a'
            element :dataInicial, :xpath, './/*[@id="activities-finish-form"]/div[2]/div[1]/div/div[2]/div/div/div[1]/div/input'
            element :trinta, :xpath, './/*[@id="start_time__date_table"]/tbody/tr[5]/td[3]/div'
            element :fecharData, 'button[class=\'btn-flat picker__close\']'
            element :dataFinal, :xpath, './/*[@id="activities-finish-form"]/div[2]/div[2]/div/div[2]/div/div/div[1]/div/input'
            element :trintaum, :xpath, './/*[@id="end_time__date_table"]/tbody/tr[5]/td[4]/div'
            element :salvarRascunho, 'button[id=\'save_as_draft_button\']'
            element :buscarSimulado, :xpath, './/*[contains(text(), "Simulado2 - Internet Publicar")]'
            element :buscarSimuladoApagar, :xpath, './/*[contains(text(), "simuladoApagar - Internet Publicar")]'
            element :publicar, 'a[href=\'#publish-modal\']'
            element :confirmarPublicacao, :xpath, './/*[@id="publish-modal"]/div[2]/a[1]'
            element :msgSucesso, '.toast'
            element :sair, '#sidebar-signout'
            element :fecharMsg, '.close'
            element :erro, 'p[class=\'error\']'
            element :msgErro, '.toast'
            element :erroDataInicial, :xpath, './/*[@id="activities-finish-form"]/div[2]/div[1]/div/div[2]/div/div/div[4]/div'
            element :erroDatafinal, :xpath, './/*[@id="activities-finish-form"]/div[2]/div[2]/div/div[2]/div/div/div[4]/div'
            element :publicarfinal , 'button[id=\'publish_button\']'
            element :apagar, 'a[href=\'#delete-modal\']'
            element :confirmarApagar, :xpath, './/*[@id="delete-modal"]/div[2]/a[1]'

            def fazerLogoutProf()
                self.sair.click
            end  

            def criarSimuladoRascunho(nome,codigo)
                self.simulado.click
                self.novoSimulado.click
                self.nomeSimulado.set 'Simulado1 - Teste Internet'
                self.proximo.click
                self.wait_for_tecnologia
                self.tecnologia.click
                self.wait_for_internet
                self.internet.click
                self.proximo2.click
                self.ano.click
                self.dataAno.click
                self.dificuldade.click
                self.media.click
                page.execute_script "window.scrollBy(0,1000)"
                self.fonte.click
                self.nomeFonte.click
                self.habilidade.click
                self.nomeHabilidade.click
                self.enen.click
                self.nomeEnen.click
                self.codigo.set '2982'
                self.buscar.click
                page.execute_script "window.scrollBy(0,1500)"
                self.adicionarQuestao.click
                self.proximo3.click
                self.wait_for_salvarRascunho
                self.salvarRascunho.click
            end

            def criarSimuladoPublicar(nome,codigo)
                self.simulado.click
                self.novoSimulado.click
                self.nomeSimulado.set 'Simulado2 - Internet Publicar'
                self.proximo.click
                self.wait_for_tecnologia
                self.tecnologia.click
                page.execute_script "window.scrollBy(0,1000)"
                self.wait_for_internet
                self.internet.click
                self.proximo2.click
                self.ano.click
                self.dataAno.click
                self.dificuldade.click
                self.media.click
                page.execute_script "window.scrollBy(0,1000)"
                self.fonte.click
                self.nomeFonte.click
                self.habilidade.click
                self.nomeHabilidade.click
                self.enen.click
                self.nomeEnen.click
                self.codigo.set '2982'
                self.buscar.click
                page.execute_script "window.scrollBy(0,1500)"
                self.adicionarQuestao.click
                self.proximo3.click
                page.execute_script "window.scrollBy(0,1000)"
                self.dataInicial.click
                self.trinta.click
                self.fecharData.click
                self.dataFinal.click
                self.trintaum.click
                self.fecharData.click
                self.wait_for_salvarRascunho
                self.salvarRascunho.click
                page.execute_script "window.scrollBy(0,1500)"
                self.buscarSimulado.click
                self.publicar.click
                self.confirmarPublicacao.click
            end

            def criarSimuladoSemNome()
                self.simulado.click
                self.novoSimulado.click
                self.proximo.click
            end

            def criarSimuladoSemConteudo(nome)
                self.simulado.click
                self.novoSimulado.click
                self.nomeSimulado.set 'Simulado3 - Internet Publicar'
                self.proximo.click
                self.wait_for_tecnologia
                self.tecnologia.click
                page.execute_script "window.scrollBy(0,1000)"
                self.proximo2.click
            end

            def criarSimuladoSemQuestao(nome)
                self.simulado.click
                self.novoSimulado.click
                self.nomeSimulado.set 'Simulado4 - Internet Publicar'
                self.proximo.click
                self.wait_for_tecnologia
                self.tecnologia.click
                page.execute_script "window.scrollBy(0,1000)"
                self.wait_for_internet
                self.internet.click
                self.proximo2.click
                self.proximo3.click
            end

            def criarSimuladoComDataMenorOuIgual(nome,codigo)
                self.simulado.click
                self.novoSimulado.click
                self.nomeSimulado.set 'Simulado5 - Internet Publicar'
                self.proximo.click
                self.wait_for_tecnologia
                self.tecnologia.click
                page.execute_script "window.scrollBy(0,1000)"
                self.wait_for_internet
                self.internet.click
                self.proximo2.click
                self.ano.click
                self.dataAno.click
                self.dificuldade.click
                self.media.click
                page.execute_script "window.scrollBy(0,1000)"
                self.fonte.click
                self.nomeFonte.click
                self.habilidade.click
                self.nomeHabilidade.click
                self.enen.click
                self.nomeEnen.click
                self.codigo.set '2982'
                self.buscar.click
                page.execute_script "window.scrollBy(0,1500)"
                self.adicionarQuestao.click
                self.proximo3.click
                page.execute_script "window.scrollBy(0,1000)"
                self.publicarfinal.click
            end

            def criarSimuladoEApagar(nome,codigo)
                self.simulado.click
                self.novoSimulado.click
                self.nomeSimulado.set 'simuladoApagar - Internet Publicar'
                self.proximo.click
                self.wait_for_tecnologia
                self.tecnologia.click
                self.wait_for_internet
                self.internet.click
                self.proximo2.click
                self.ano.click
                self.dataAno.click
                self.dificuldade.click
                self.media.click
                page.execute_script "window.scrollBy(0,1000)"
                self.fonte.click
                self.nomeFonte.click
                self.habilidade.click
                self.nomeHabilidade.click
                self.enen.click
                self.nomeEnen.click
                self.codigo.set '2982'
                self.buscar.click
                page.execute_script "window.scrollBy(0,1500)"
                self.adicionarQuestao.click
                self.proximo3.click
                self.wait_for_salvarRascunho
                self.salvarRascunho.click
                page.execute_script "window.scrollBy(0,1500)"
                self.buscarSimuladoApagar.click
                self.apagar.click
                self.confirmarApagar.click
            end
            
       end
    end
end