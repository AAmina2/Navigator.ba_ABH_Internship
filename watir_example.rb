require 'watir'
require 'rspec'

browser = Watir::Browser.new(:chrome)
browser.goto("http://facebook.com")
browser.text_field(:id, "email").set("testingintern@hotmail.com")
browser.text_field(:id, "pass").set("atlant")
browser.button(:value,"Log In").click
browser.text_field(:value, "What's on your mind, Jane?").set("Demo Day? Already?! :O")

browser.button(:value, "Post").click
browser.button(:value, "Post").click

sleep 3

browser.quit


