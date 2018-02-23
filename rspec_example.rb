require 'rspec'
require 'rspec/expectations'
require 'watir'
require 'capybara'

browser = Watir::Browser.new(:chrome)

describe "User" do
context 'Log in' do
it 'Input email and pass' do

browser.goto("http://facebook.com")
browser.text_field(:id, "email").set("testingintern@hotmail.com")
browser.text_field(:id, "pass").set("atlant")
browser.button(:value,"Log In").click

expect("2").to eq("2")

end
end
end
