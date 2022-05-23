require "rubygems"
require "selenium-webdriver"

user = ENV['BROWSERSTACK_USERNAME']
key = ENV['BROWSERSTACK_ACCESS_KEY']
capabilities = {
    'browserName' => 'Chrome',
    'browserVersion' => 'latest',
    'bstack:options' => {
        'os' => 'Windows',
        'osVersion' => '11',
        'projectName' => 'SAUCEDEMO_AUTOMATED_TESTS_V1',
        'buildName' => 'ALPHA_0.0.1',
        'sessionName' => 'HOME_PAGE_MUST_HAVE_A_TITLE',
        'local' => 'false',
        'debug' => 'true',
        'consoleLogs' => 'info',
        'networkLogs' => 'true',
    }    
}
driver = Selenium::WebDriver.for(:remote,
    :url => "https://"+user+":"+key+"@hub-cloud.browserstack.com/wd/hub",
    :desired_capabilities => capabilities)
## BROWSERSTACK WILL BE MODULED




