begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end

require 'selenium-webdriver'
require 'rubygems'
require 'byebug'
require 'cucumber'
require 'fileutils'
require_relative '../../features/support/local_driver'



#GLOBAL VAR SETTING
ENV['BROWSER_TYPE'] = 'chrome'
ENV['OS'] = 'mac'
ENV['URL'] = 'https://www.saucedemo.com/'
ENV['DELAY_STEP'] = '1'


begin
  
  if $driver_created
    LocalDriver.instance.start_app
  else  
    
    env = ENV['BROWSER_TYPE'].downcase

    case env    

      when 'chrome'

        if (ENV['OS'].downcase == 'mac')
          Selenium::WebDriver::Chrome::Service.driver_path="assets/driver/chrome/chromedriver"

        elsif (ENV['OS'].downcase == 'windows')
          Selenium::WebDriver::Chrome.driver_path="assets/driver/chrome/chromedriver.exe"
        end
        args = ['disable-web-security', 'ignore-certificate-errors', 'disable-popup-blocking', 'disable-translate','-port', '4723']
        capabilities = Selenium::WebDriver::Chrome::Options.new(args: args)

      when 'firefox'
        if (ENV['OS'].downcase == 'mac')
          Selenium::WebDriver::Firefox.driver_path="assets/driver/firefox/geckodriver"
        elsif (ENV['OS'].downcase == 'windows')
          Selenium::WebDriver::Firefox.driver_path="assets/driver/firefox/geckodriver.exe"
        end
        capabilities = Selenium::WebDriver::Remote::Capabilities.firefox(accept_insecure_certs: true)
      
      when 'safari'
        $driver = Selenium::WebDriver.for :safari
      else
        raise "Not supported platform #{env}"
    end

    LocalDriver.instance.pub_capabilities(capabilities)

  end
rescue Exception => e
  raise e.message
end

