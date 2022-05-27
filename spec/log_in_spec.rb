require_relative "../rails_helper"
require "rubygems"
require "selenium-webdriver"

def run_session(capabilities)
  user = ENV['BROWSERSTACK_USERNAME']
  key = ENV['BROWSERSTACK_ACCESS_KEY']
  capabilities = {
      'browserName' => 'Firefox',
      'browserVersion' => 'latest',
      'bstack:options' => {
          'os' => 'Windows',
          'osVersion' => '11',
          'projectName' => 'SAUCEDEMO_AUTOMATED_TESTS_V1',
          'buildName' => 'ALPHA_0.0.1',
          'sessionName' => 'LOGIN_PAGE_MUST_BE_TESTED',
          'local' => 'false',
          'debug' => 'true',
          'consoleLogs' => 'info',
          'networkLogs' => 'true',
          'resolution' => '1024x768',
      }    
  }
  driver = Selenium::WebDriver.for(:remote,
      :url => "https://"+user+":"+key+"@hub-cloud.browserstack.com/wd/hub",
      :desired_capabilities => capabilities)

  driver.navigate.to "https://www.saucedemo.com/"
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

  RSpec.describe 'A user with the correct credentials', type: :feature do
    it "inputs them on the login page", issue_14: "QA-14" do
      it "should be redirected to the dashboard" do

        expect(page).to have_title('Swag Labs')
        fill_in 'username', with: 'standard_user'
        fill_in 'Password', with: 'secret_sauce'

        click_button 'Login'

        expect(page).to have_content('standard_user')
        expect(current_path).to eq('https://www.saucedemo.com/inventory.html')
      end
    end
  end
  # For marking test as passed
  driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "Test passed"}}')
  driver.quit

  driver = Selenium::WebDriver.for(:remote,
      :url => "https://"+user+":"+key+"@hub-cloud.browserstack.com/wd/hub",
      :desired_capabilities => capabilities)

  driver.navigate.to "https://www.saucedemo.com/"
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

  RSpec.describe 'A user with no credential', type: :feature do
    it "inputs nothing on the login page", issue_15: "QA-15" do
      it "should be displayed an error message" do

        fill_in 'username', with: ''
        fill_in 'Password', with: ''

        click_button 'Login'
        expect(page).to have_text('Username is required')    
      end
    end
  end

  RSpec.describe 'A user without password', type: :feature do
    it "inputs only the username on the login page", issue_16: "QA-16" do
      it "should be displayed an error message" do

        fill_in 'username', with: 'locked_out_user'
        fill_in 'Password', with: ''

        click_button 'Login'
        expect(page).to have_content('locked_out_user')
        expect(page).to have_text('Password is required')      
      end
    end
  end

  RSpec.describe 'A user without username', type: :feature do
    it "inputs only the password on the login page", issue_17: "QA-17" do
      it "should be displayed an error message" do

        fill_in 'username', with: ''
        fill_in 'Password', with: 'secret_sauce'

        click_button 'Login'
        expect(page).to have_text('Username is required')      
      end
    end
  end

  RSpec.describe 'A user with the correct credentials', type: :feature do
    it "inputs them on the login page with the caps lock on", issue_18: "QA-18" do
      it "should be displayed an error message" do

        fill_in 'username', with: 'PERFORMANCE_GLITCH_USER'
        fill_in 'Password', with: 'SECRET_SAUCE'

        click_button 'Login'
        expect(page).to have_content('PERFORMANCE_GLITCH_USER')
        expect(page).to have_text('Username and password do not match any user in this service')      
      end
    end
  end

  RSpec.describe 'A user with the wrong usename', type: :feature do
    it "inputs it on the login page", issue_19: "QA-19" do
      it "should be displayed an error message" do

        fill_in 'username', with: 'unmatched_user'
        fill_in 'Password', with: 'secret_sauce'

        click_button 'Login'
        expect(page).to have_content('unmatched_user')
        expect(page).to have_text('Username and password do not match any user in this service')      
        end
    end
  end

  RSpec.describe 'A user with the wrong password', type: :feature do
    it "inputs it on the login page", issue_20: "QA-20" do
      it "should be displayed an error message" do

        fill_in 'username', with: 'problem_user'
        fill_in 'Password', with: 'hot_secret_sauce'

        click_button 'Login'
        expect(page).to have_content('problem_user')
        expect(page).to have_text('Username and password do not match any user in this service')      
        end
    end
  end

  # For marking test as failed
  driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed","reason": "My tests failed on purpuse"}}')
  driver.quit

end