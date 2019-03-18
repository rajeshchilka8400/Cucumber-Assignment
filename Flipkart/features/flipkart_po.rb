class Flipkart

require 'rubygems'
require 'selenium-webdriver'
require 'yaml'

attr_reader :driver

def initialize (url)
# Input capabilities
caps = Selenium::WebDriver::Remote::Capabilities.new
caps['browser'] = 'Chrome'
caps['browser_version'] = '73.0'
caps['os'] = 'Windows'
caps['os_version'] = '10'
caps['resolution'] = '1024x768'
config = YAML::load_file(File.join(__dir__, 'config.yml'))
username = config['USERNAME']
password = config['PASSWORD']

@driver = Selenium::WebDriver.for(:remote,
  :url => "http://#{username}:#{password}@hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)
 @driver.navigate.to url

end

def login
	element = driver.find_element(:css, 'body > div.mCRfo9 > div > div > button')
	element.click
end

def search_for_product (product)
	element_product = @driver.find_element(:name, 'q')
	element_product.send_keys product
	element_product.submit
end

def search_results
	sleep(5)
	element_search = @driver.find_elements(:css, 'div._3O0U0u')
	element_search.count
end

def quit_driver
  	@driver.quit
end


end
