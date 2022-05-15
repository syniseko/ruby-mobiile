require 'rubygems'
require 'selenium-webdriver'

def user_fill(selector, element, data)
    begin
    
    sleep ENV['DELAY_STEP'].to_i
    $driver.find_element(selector.to_sym,element).send_keys(data)
    log "user fill element #{selector}:#{element}"

    rescue Exception => e
      raise e.message
    end
end