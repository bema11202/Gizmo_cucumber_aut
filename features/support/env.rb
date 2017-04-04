
require "selenium-webdriver"
require "appium_lib"
require "rspec"
require "rspec/expectations"
require "cucumber"
require "rdoc"
require "pp"

Before do
def capabilities
capabilities = {
    'appium-version': '1.0',
    'platformName': 'Android',
    'platformVersion': '6.0',
    'deviceName': 'Galaxy J3',
    'app': '/Users/B.Masoko/Desktop/GIZMOPAL/apks/Vzw_GizmoPal_2_3_42_Test.apk',
}
end

def server_url
 "http://127.0.0.1:4723/wd/hub"
end

=begin
def appium_driver
 @driver= Appium::Driver.new(caps: capabilities).start_driver
 Appium.promote_appium_methods Object
end
=end

@driver = Selenium::WebDriver.for :remote,

desired_capabilities: capabilities,
url: "http://127.0.0.1:4723/wd/hub"


def wait
 Selenium::WebDriver::Wait.new :timeout => 30
end


end

def success
 puts 'Scenario: PASS'.upcase
end




After{@driver.quit}

