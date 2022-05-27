require 'rubygems'
require 'selenium-webdriver'
require 'rails_helper'

def run_session(caps)
username = ENV["BROWSERSTACK_USERNAME"]
access_key = ENV["BROWSERSTACK_ACCESS_KEY"]
browserstack_local = ENV["BROWSERSTACK_LOCAL"]
browserstack_local_identifier = ENV["BROWSERSTACK_LOCAL_IDENTIFIER"]
caps = Selenium::WebDriver::Remote::Capabilities.new
caps["os"] = "Windows"
caps["browser"] = "chrome"
caps["browserstack.local"] = browserstack_local
caps["browserstack.localIdentifier"] = browserstack_local_identifier
caps["browserstack.user"] = username
caps["browserstack.key"] = access_key

driver = Selenium::WebDriver.for(:remote,
  :url => "https://hub-cloud.browserstack.com/wd/hub",
  :desired_capabilities => caps)

	driver.navigate.to "https://www.saucedemo.com/"
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

  RSpec.describe 'Dashboard tests', type: :feature do
    it "reaches the navigation side bar", issue_41: "QA-41" do
      it "should log out properly" do

        fill_in 'username', with: 'standard_user'
        fill_in 'Password', with: 'secret_sauce'
        click_button 'Login'
        expect(current_path).to eq('https://www.saucedemo.com/inventory.html')

        click_button 'Open Menu'

        click_button 'Logout'
        expect(current_path).to eq(root_path)
        end
    end
  end

  # For marking test as passed
  driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "Test passed"}}')
  driver.quit
end