require "selenium-webdriver"
driver = Selenium::WebDriver.for :firefox
driver.navigate.to "http://www.navigator.ba"
element = driver.find_element(:id, "ember564")
element.send_keys "Ambrosia"
driver.find_element(:class, "iconav-search").click

