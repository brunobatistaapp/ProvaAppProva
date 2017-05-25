require_relative 'helper.rb'

World(Helper)

Before ('@loginAluno')do
       loginAluno.load
       loginAluno.email.set 'brunobatista101@gmail.com'
       loginAluno.senha.set 'morato91'
       loginAluno.entrar.click          
end

Before ('@loginAluno2')do
       loginAluno.load
       loginAluno.email.set 'brunobatistatestes@gmail.com'
       loginAluno.senha.set '123456'
       loginAluno.entrar.click          
end

Before ('@loginProf')do
       visit 'http://professor.mobile.stg.appprova.com.br/teachers/sign_in'
       loginProf.email.set 'qa@appprova.com.br'
       loginProf.senha.set 'loveqaatappprova'
       loginProf.lembrar.click
       loginProf.entrar.click
end

After('@logoutAluno') do
     homeAluno.fazerLogoutAluno()
end   

After('@logoutProf') do
     homeProf.fazerLogoutProf()
end    

After do |scenario|
       scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
       scenario_name = scenario_name.gsub(',', '')
       scenario_name = scenario_name.gsub('(', '')
       scenario_name = scenario_name.gsub(')', '')
       scenario_name = scenario_name.gsub('#', '')
    if scenario.failed?
       take_screenshot(scenario_name.downcase!, 'failed')
    else
       take_screenshot(scenario_name.downcase!, 'passed')
    end
end