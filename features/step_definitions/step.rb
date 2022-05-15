require 'rubygems'
require "selenium-webdriver"
require 'yaml'
require 'fileutils'


And(/^Open Browser App$/) do
  begin

    LocalDriver.instance.start_driver
    # sleep 

  rescue Exception => e
    raise e.message
  end
end


And(/^User login with data account "([^"]*)"$/) do |testData|
  begin

    tmpLogin = key_processor_login(testData)
    email_data = tmpLogin.split('#').first
    password_data = tmpLogin.split('#').last

    

    email_field = key_processor_element('login/login_page/email_field')
    user_fill(email_field[0], email_field[1], email_data)

    password_field = key_processor_element('login/login_page/password_field')
    user_fill(password_field[0], password_field[1], password_data)


  rescue Exception => e
    raise e.message
  end
end


And(/^User click "([^"]*)"$/) do |element|
  begin
    
    element = key_processor_element(element)
    user_click(element[0], element[1])

  rescue Exception => e
    raise e.message
  end
end
 

And(/^User verify element "([^"]*)" with data translation "([^"]*)"$/) do |element,testData|
  begin
    
    element = key_processor_element(element)
    data = key_processor_translation(testData)
    user_expect_with_data(element[0], element[1], data)


  rescue Exception => e
    raise e.message
  end
end


And(/^User verify element "([^"]*)" attribute "([^"]*)" with data translation "([^"]*)"$/) do |element,attribute,testData|
  begin
    
    element = key_processor_element(element)
    data = key_processor_translation(testData)

    user_expect_attribute_with_data(element[0], element[1], attribute, data)

  rescue Exception => e
    raise e.message
  end
end


And(/^User fill element "([^"]*)" with data translation "([^"]*)"$/) do |element,testData|
  begin
  
    element = key_processor_element(element)
    data = key_processor_translation(testData)
    user_fill(element[0], element[1], data)


  rescue Exception => e
    raise e.message
  end
end


And(/^User wait (\d+) seconds/) do |number|
  begin

    number = number.to_i
    sleep(number)

  rescue Exception => e
    error_handler(e)
  end
end


And(/^System screenshoot page$/) do
  begin

    snapshot_path = 'assets/screenshoot/screenshoot.png'
    $driver.save_screenshot(snapshot_path)
    file = File.open(snapshot_path)
    attach(file,'image/png')

  rescue Exception => e
    error_handler(e)
  end
end







#spesific test step
And(/^Verify data price products sort by highest to low$/) do 
  begin


    arryData = loopingProducts

    sortDt = arryData.sort_by {|e| -e[/\d+/].to_i }
    status = (arryData == sortDt)

    if ((arryData == sortDt) == true)
      log "data is expected sort highest to low"
      log "actual data -->#{arryData}\nsort data --> #{sortDt}"
    else
      raise "data not sourting on page, the data = #{arryData}"
    end

  rescue Exception => e
    raise e.message
  end
end





############################################# PRIVATE FUNCTIONS #######################################

def key_processor_login(data)

  login_data_hash = YAML.load_file "resources/test_data.yml"
  element_data_key = data
  dataLogin = (login_data_hash[element_data_key])

  return dataLogin
end 

def key_processor_translation(data)

  translation_data_hash = YAML.load_file "resources/translation_data.yml"
  dataTranslation = (translation_data_hash[data])

  return dataTranslation
end 


def key_processor_element(element)
  begin

    selector_use = element.split('/').last
    arr_path = element.split('/')
    arr_path.pop
    path = arr_path.join("/")

    element_selectors = YAML.load_file("resources/elements/#{path}.yml")
    tmp_selectors = (element_selectors[selector_use])

    selector = tmp_selectors.split(':').first
    locator = tmp_selectors.partition(':').last

    selector_data = [selector,locator]

    return selector_data

  rescue Exception => e
    raise e.message
  end
end


def loopingProducts
  begin
    dataArray = []
    index = 1
    loop do                          
      if $driver.find_element(:xpath,"//*[@id='inventory_container']/div/div[#{index}]/div[2]/div[2]/div").displayed? == true
         text = $driver.find_element(:xpath,"//*[@id='inventory_container']/div/div[#{index}]/div[2]/div[2]/div").text
         dataArray << text
         index+=1
      else
        break
      end
    end

  rescue Exception => e
     log "Data items product last on index #{index-1}" 
     return dataArray
  end
end