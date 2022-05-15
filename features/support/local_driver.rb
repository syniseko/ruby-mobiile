require 'singleton'


class LocalDriver
  include Singleton
  attr_reader :driver

  def initialize
    $driver = nil
  end

  def pub_capabilities(capabilities)
    $pub_cap = capabilities
  end

  def set_mobile_emulation(cab)
    $pub_cap.add_emulation(device_metrics: cab)
  end

  def start_driver
    case ENV['BROWSER_TYPE'].downcase
      when 'chrome'
        
        client = Selenium::WebDriver::Remote::Http::Default.new
        client.read_timeout = 600 
        client.open_timeout = 600 
        $driver = Selenium::WebDriver.for :chrome, options: $pub_cap,http_client: client
        $driver.manage.window.maximize
        $driver.navigate.to "#{ENV['URL']}"

      when 'firefox'
        $driver = Selenium::WebDriver.for :firefox, desired_capabilities: $pub_cap
        $driver.manage.window.maximize
        $driver.navigate.to "#{ENV['URL']}"
    end
  end

  #This method is used for close web the driver, currently to close the selenium driver
  def close_web
    $driver.close
  end



end