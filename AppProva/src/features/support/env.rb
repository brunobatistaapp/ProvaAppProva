require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec/matchers'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'faker'
require 'ostruct'
require_relative 'page_helper.rb'
require_relative 'helper.rb'
#Importa as gems

#Coloca as variáveis como global
World(Capybara::DSL)
World(Capybara::RSpecMatchers)
World(AppProva::Pages)
World(Helper)

#Variável para o nome do ambiente
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
#Variável para o nome do browser
BROWSER = ENV['BROWSER']
#Configuração para dizer o caminho do ambiente a se usar
CONFIG = YAML.load_file(File.dirname(__FILE__) + "/data/#{ENVIRONMENT_TYPE}.yml")

#Configura o tipo de browser
Capybara.register_driver :selenium do |app|
 if BROWSER.eql?('chrome')
    Capybara::Selenium::Driver.new(app,
    :browser => :chrome,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
      'chromeOptions' => { 'args' => [ "--start-maximized" , "--disable-infobars" ]})
      )
  elsif BROWSER.eql?('firefox')
     Capybara::Selenium::Driver.new(app,
    :browser => :firefox,
    :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.firefox(marionette: true))
 end
end

#Configura o link principal e qual navegador vai usar
Capybara.configure do |config|
   config.default_driver = :selenium
   config.app_host = CONFIG['url']
end

#Configura o tempo máximo de espera
Capybara.default_max_wait_time = 5