require 'rubygems'
require 'selenium-webdriver'

def user_click(selector, element)
    begin
    
    sleep ENV['DELAY_STEP'].to_i
    $driver.find_element(selector.to_sym,element).click
    log "user click element #{selector}:#{element}"

    rescue Exception => e
      raise e.message
    end
end