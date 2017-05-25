#Diz quais páginas irão usar padrão page objects
Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file }

module AppProva
    module Pages
        def loginProf
            AppProva::Pages::LoginProfPage.new
        end
        def loginAluno
            AppProva::Pages::LoginAlunoPage.new
        end
         def homeAluno
            AppProva::Pages::HomeAlunoPage.new
        end
        def cadastrarAluno
            AppProva::Pages::CadastrarAlunoPage.new
        end
        def homeProf
            AppProva::Pages::HomeProfPage.new
        end
    end
end