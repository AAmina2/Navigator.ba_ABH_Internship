require 'capybara/rspec'
require 'selenium-webdriver'

session = Capybara::Session.new :selenium
Capybara.default_max_wait_time = 10
session.visit 'https://www.facebook.com/'

session.fill_in ('email'), with: ('testingintern@hotmail.com')
session.fill_in ('pass'), with: ('atlant')
session.click_button ('Log In')
session.fill_in ("What's on your mind, Jane?"), with: ("Demo day? Already?! :O")
session.click_button ('Post')
session.click_button ('Post')

sleep 10
