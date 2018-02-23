require "rspec/expectations"
require "selenium-webdriver"
require 'rspec-api-matchers'
require 'rspec'
require 'watir'
require 'capybara/rspec'

Dir[File.dirname(__FILE__) + '/environment.rb'].each {|file| require file }

#driver = Selenium::WebDriver.for :firefox
browser = Capybara::Session.new :selenium

Capybara.ignore_hidden_elements = false

browser.visit "http://www.navigator.ba"
puts browser.title
describe 'Go to www.navigator.ba' do

context 'New object' do
browser.find(:id, "ember572").click

browser.title
end

context 'Basic info' do
it 'Fills in the information' do

name = browser.fill_in "poi_name", with: "Žuti kutak"
expect(name.value).to eq("Žuti kutak")

city = browser.fill_in "poi_city_name", with: "Sarajevo"
expect(city.value).to eq("Sarajevo")

zip = browser.fill_in "poi_zip_code", with: "71000"
expect(zip.value).to eq("71000")

address = browser.fill_in "poi_place_id", with: "Mala Aleja"
expect(address.value).to eq ("Mala Aleja")

nb = browser.fill_in "poi_house_number", with: "15"
expect(nb.value).to eq("15")

desc = browser.fill_in "poi_description", with: "Slatke palačinke, slane palačinke,protein palačinke, wafli, sendviči, milkšejkovi. Čekamo vas ! Zaviri u ŽutiKutak!"
expect(desc.value).to eq("Slatke palačinke, slane palačinke,protein palačinke, wafli, sendviči, milkšejkovi. Čekamo vas ! Zaviri u ŽutiKutak!")

end
end

context 'Pozicioniranje na mapi' do 
#marker = driver.find_element(:css, ".leaflet-marker-icon")
it 'Pomjeri marker' do
driver = Selenium::WebDriver.for :firefox

marker = driver.find_element(:css, ".leaflet-marker-icon")
driver.action.drag_and_drop_by(marker, "-100", "100").perform
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
browser.click_on("Odaberite kategoriju")
browser.click_on("Odaberite kategoriju")
#driver.find_button(:id, "ember937").click

sleep 1

end
it 'Choose primary category' do
#category_a = browser.find(:css, ".category-selector-row > div:nth-child(2)").click
#category_a.find(:css, ".category-selector-row > div:nth-child(2) > select:nth-child(1) > option:nth-child(5)").click
#category_a = browser.find(:css, ".category-selector-row > div:nth-child(2)")
category_a = browser.find( "ember1617 > div > div.span3")
#category_a = browser.click_on(:css, ".category-selector-row > div:nth-child(2)")

option = browser.find(".category-selector-row > div:nth-child(2) > select:nth-child(1) > option:nth-child(5)")
browser.select(option, :from => category_a)

#option = driver.find_element(:css, ".category-selector-row > div:nth-child(2) > select:nth-child(1) > option:nth-child(5)").click


sleep 1
end
it 'Choose secondary category' do

#category_b = browser.find(:css,".category-selector-row > div:nth-child(3)").click
#category_b.find(:css, ".category-selector-row > div:nth-child(3) > select:nth-child(1) > option:nth-child(5)").click
category_b = browser.find(:css, ".category-selector-row > div:nth-child(3)")
#category_b = driver.find_element(:css, ".category-selector-row > div:nth-child(3)").click
option_b = browser.find(:css, ".category-selector-row > div:nth-child(3) > select:nth-child(1) > option:nth-child(5)")
#option_b = driver.find_element(:css, ".category-selector-row > div:nth-child(3) > select:nth-child(1) > option:nth-child(5)").click
browser.select(option_b, :from => category_b)

end
it 'Add tag' do
tag = browser.find(:css, "input.ui-widget-content").set("pancakes")
expect(tag.value).to eq("pancakes")
end
end

context 'Working hours' do
it 'Choose days' do
sleep 1
browser.find(:id, "btn_day_sat").click
browser.find(:id, "btn_day_sat").click
sleep 1
browser.find(:id, "btn_day_sun").click
end
it 'Choose hours' do
am = browser.find(:id, "working_hours_0_0").set("09:00")
expect(am.value).to eq("09:00")
pm = browser.find(:id, "working_hours_0_1").set("23:00")
expect(pm.value).to eq("23:00")
browser.find(:css, ".btnAddWorkingHours").click
end
end

context 'Phone number' do
it 'Fills in a phone number' do
phone = browser.find(:id, "poi_mobile_phone").set("061869997")
expect(phone.value).to eq("061869997")
end
end

context 'Web' do
it 'Social networks' do
fb = browser.find(:id, "poi_facebook_url").set("https://www.facebook.com/Zutikutak/")
expect(fb.value).to eq("https://www.facebook.com/Zutikutak/")
ig = browser.find(:id, "poi_instagram_url").set("https://www.instagram.com/zuti_kutak/?hl=en")
expect(ig.value).to eq("https://www.instagram.com/zuti_kutak/?hl=en")
ta = browser.find(:id, "poi_tripadvisor_url").set("https://www.tripadvisor.com/Restaurant_Review-g294450-d10349973-Reviews-Zuti_Kutak-Sarajevo_Sarajevo_Canton.html")
expect(ta.value).to eq("https://www.tripadvisor.com/Restaurant_Review-g294450-d10349973-Reviews-Zuti_Kutak-Sarajevo_Sarajevo_Canton.html")

end
end

context 'Wireless checkbox' do
it 'Object has wifi?' do
wifi = browser.check("poi_has_wifi")
wifi = browser.check("poi_has_wifi")

expect(wifi.value).to eq("on")
end
end

context 'Photo' do
it 'Uploads logo' do
logo = browser.find(:id, "fileToUpload")
logo.set('/home/linux_amina/Desktop/zutikutak.jpeg')

sleep 10
end
end

#context "Create an object" do
#it "Clicks Create button" do
#browser.click_on("Kreiraj")

#sleep 3
#end 
#end

context 'Returns to homepage' do
it 'Clicks on navigator logo' do
browser.find(:id, "ember551").click

end
end

context 'Search' do
it 'Searches for an object' do  
element = browser.find(:id, "ember564")
search = element.set("Ambrosia")
expect(search.value).to eq("Ambrosia")
browser.find(:css, ".iconav-search").click

sleep 5
end
end

end

#driver.close
