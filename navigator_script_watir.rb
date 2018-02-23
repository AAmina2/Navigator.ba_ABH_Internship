require "rspec/expectations"
require "selenium-webdriver"
require 'rspec-api-matchers'
require 'rspec'
require 'watir'
require 'capybara/rspec'

Dir[File.dirname(__FILE__) + '/environment.rb'].each {|file| require file }

driver = Selenium::WebDriver.for :firefox

browser = Watir::Browser.new(:chrome)

browser.goto("http://www.navigator.ba")

describe 'Go to www.navigator.ba' do
context 'New object' do
browser.element(:id, "ember572").click

end

context 'Basic info' do
it 'Fills in the information' do

browser.text_field(:id, "poi_name").set("Žuti kutak")
browser.text_field(:id, "poi_city_name").set("Sarajevo")
browser.text_field(:id, "poi_zip_code").set("71000")
browser.text_field(:id, "poi_place_id").set("Mala Aleja")
browser.text_field(:id, "poi_house_number").set("15")
browser.element(:id, "poi_description").send_keys("Slatke palačinke, slane palačinke")

end
end

context 'Pozicioniranje na mapi' do
#marker = driver.find_element(:css, ".leaflet-marker-icon")
it 'Pomjeri marker' do

marker = driver.find_element(:css, ".leaflet-marker-icon")
driver.action.drag_and_drop_by(marker, "-800", "250").perform
driver.find_element(:css, ".leaflet-control-zoom-out").click

driver.action.drag_and_drop_by(marker, "-306", "46").perform
driver.action.drag_and_drop_by(marker, "-306", "46").perform

driver.find_element(:css, ".leaflet-control-zoom-in").click
driver.find_element(:css, ".leaflet-control-zoom-in").click

driver.action.drag_and_drop_by(marker, "-24", "22").perform
driver.action.drag_and_drop_by(marker, "-24", "22").perform

driver.find_element(:css, ".leaflet-control-zoom-in").click
driver.action.drag_and_drop_by(marker, "1", "18").perform

end
end

sleep 2
context 'Object category' do
it 'Click on a category button' do
browser.element(:id, 'ember937').click
browser.element(:id, 'ember937').click
end
it 'Choose primary category' do
category_a = browser.element(:css, ".category-selector-row > div:nth-child(2)").click
#category_a.element(:css, ".category-selector-row > div:nth-child(2) > select:nth-child(1) > option:nth-child(5)").click
category_a.element(:value, "Kafa").click
sleep 1
end
it 'Choose secondary category' do

category_b = browser.element(:css,".category-selector-row > div:nth-child(3)").click
#category_b.find(:css, ".category-selector-row > div:nth-child(3) > select:nth-child(1) > option:nth-child(5)").click
category_b.element(:value, "Slastičarna").click

end
it 'Add tag' do
browser.element(:css, "input.ui-widget-content").send_keys("pancakes")
end
end

context 'Working hours' do
it 'Choose days' do
sleep 1
browser.element(:id, "btn_day_sat").click
sleep 1

browser.element(:id, "btn_day_sun").click
end
it 'Choose hours' do
browser.element(:id, "working_hours_0_0").send_keys("09:00")
browser.element(:id, "working_hours_0_1").send_keys("23:00")
browser.element(:css, ".btnAddWorkingHours").click
end
end

context 'Phone number' do
it 'Fills in a phone number' do
browser.text_field(:id, "poi_mobile_phone").set("061869997")
end
end

context 'Web' do
it 'Social networks' do
browser.text_field(:id, "poi_facebook_url").set("https://www.facebook.com/Zutikutak/")
browser.text_field(:id, "poi_instagram_url").set("https://www.instagram.com/zuti_kutak")
browser.text_field(:id, "poi_tripadvisor_url").set("https://www.tripadvisor.com")
end
end

context 'Wireless checkbox' do
it 'Object has wifi?' do
browser.checkbox(:id,"poi_has_wifi")
end
end

context 'Photo' do
it 'Uploads logo' do
logo = browser.element(:id, "fileToUpload")
logo.send_keys('/home/linux_amina/Desktop/zutikutak.jpeg')

sleep 10
end
end

context "Create an object" do
it "Clicks Create button" do
browser.element(:css, ".btn-success").click
end
end

context 'Returns to homepage' do
it 'Clicks on navigator logo' do
browser.element(:id, "ember551").click
end
end

context 'Search' do
it 'Searches for an object' do
element = browser.element(:id, "ember564")
element.set("Ambrosia")
browser.element(:css, ".iconav-search").click

sleep 2
end
end

#browser.close
end


