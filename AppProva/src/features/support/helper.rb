# encoding: utf-8
require 'fileutils'

#Metodo para tira fotos dos erros e sucessos.
module Helper
    def take_screenshot(file_name, result)
        timer_path = Time.now.strftime('%Y_%m_%d').to_s
        file_path = "results/screenshots/test_#{result}/run_#{timer_path}"
        screenshot = "#{file_path}/#{file_name}.png"
        page.save_screenshot(screenshot)
        embed(screenshot, 'image/png', 'Clique aqui')
    end
end