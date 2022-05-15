require 'rubygems'
require 'selenium-webdriver'
require 'colorize'

def user_expect_with_data(selector, element, data)
    begin
    
        sleep ENV['DELAY_STEP'].to_i
        if $driver.find_element(selector.to_sym,element).text == data 
            log "'#{data}' displayed" 
        else
            raise "element #{selector}:#{element} with data #{data} not found on screen"
        end

    rescue Exception => e
        raise e.message
    end
end


def user_expect_attribute_with_data(selector, element, attribute, data)
    begin
    
        sleep ENV['DELAY_STEP'].to_i
        el =$driver.find_element(selector.to_sym,element)
        getAbt = el.attribute(attribute)

        if getAbt == data 
            log "Attribute '#{data}' displayed" 
        else
            raise "element attribute #{selector}:#{element} with attribute #{data} not found on screen"
        end

    rescue Exception => e
        raise e.message
    end
end