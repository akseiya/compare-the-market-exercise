require 'pry'
require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'yaml'

require_relative '../lib/pages.rb'
#require_relative '../lib/shared_examples.rb'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

def use_chromedriver
  Capybara.current_driver = :chrome
end
