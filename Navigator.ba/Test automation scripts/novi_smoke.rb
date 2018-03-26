require "rspec/expectations"
require "selenium-webdriver"
require 'rspec-api-matchers'
require 'rspec'
require 'watir'
require 'capybara/rspec'

Dir[File.dirname(__FILE__) + '/environment.rb'].each {|file| require file }

#d = Selenium::WebDriver.for :firefox
b = Capybara::Session.new :selenium

Capybara.ignore_hidden_elements = false

describe 'Go to www.navigator.ba' do
   context 'New object' do
      it 'Clicks new object button' do
	 b.visit "http://www.navigator.ba"
         expect(b.text).to include('Kreiraj objekat')
         b.find(:id, "ember572").click
         expect(b.text).to include('Detalji o objektu')
      end
      it 'Fills in basic info' do
         name = b.fill_in "poi_name", with: "Žuti kutak"
         expect(name.value).to eq("Žuti kutak")

         city = b.fill_in "poi_city_name", with: "Sarajevo"
         expect(city.value).to eq("Sarajevo")

         zip = b.fill_in "poi_zip_code", with: "71000"
         expect(zip.value).to eq("71000")

         address = b.fill_in "poi_place_id", with: "Mala Aleja"
         expect(address.value).to eq ("Mala Aleja")

         nb = b.fill_in "poi_house_number", with: "15"
         expect(nb.value).to eq("15")

         desc = b.fill_in "poi_description", with: "Slatke palačinke, slane palačinke,protein palačinke, wafli, sendviči, milkšejkovi. Čekamo vas! Zaviri u Žuti kutak"
         expect(desc.value).to eq("Slatke palačinke, slane palačinke,protein palačinke, wafli, sendviči, milkšejkovi. Čekamo vas! Zaviri u Žuti kutak")
      end
      #it 'Position marker on the map' do
         #marker = b.find(".leaflet-marker-icon")
	 #marker.simulateDragSortable({ move: 1 })
         #d.b.action.drag_and_drop_by(marker, "-800", "250").perform
	 #sleep 1
	 #d.b.find(".leaflet-control-zoom-out").click
	 #sleep 1
	 #d.b.action.drag_and_drop_by(marker, "-304", "46").perform
	 #d.b.action.drag_and_drop_by(marker, "-304", "46").perform
	 #sleep 1
	 #d.b.find(".leaflet-control-zoom-in").click
	 #d.b.find(".leaflet-control-zoom-in").click
	 #sleep 1
	 #d.b.action.drag_and_drop_by(marker, "-24", "22").perform
	 #d.b.action.drag_and_drop_by(marker, "-24", "22").perform
	 #sleep 1
	 #d.b.find(".leaflet-control-zoom-in").click
	 #sleep 1
	 #driver.action.drag_and_drop_by(marker, "1", "18").perform
	 #sleep 1
      #end
      it 'Click on a category button' do
         b.find(:css, ".ember-view.btn.btn-small").click
         b.find(:css, ".ember-view.btn.btn-small").click
	 #expect(b).to have_button(:css, ".ember-view.btn.btn-small") 

         sleep 1
      end
      it 'Choose category' do
         category = b.find(:css, ".category-selector-row > div:nth-child(2)").click
         option = b.find(:css, ".category-selector-row > div:nth-child(2) > select:nth-child(1) > option:nth-child(5)", :visible => false).click
         sleep 1
      end
      it 'Add tag' do
         tag = b.find(:css, "input.ui-widget-content").set("pancakes")
         expect(tag.value).to eq("pancakes")
      	 sleep 1
      end
      it 'Radno vrijeme' do
	 sat = b.find(:id, "btn_day_sat")
	 sat.click
	 sat.click
	 b.find(:id,"btn_day_sun").click
	 am = b.find(:id, "working_hours_0_0").set("09:00")
	 expect(am.value).to eq("09:00")
	 pm = b.find(:id, "working_hours_0_1").set("23:00")
	 expect(pm.value).to eq("23:00")
	 b.find(:css, ".btnAddWorkingHours").click
      end
      it 'Telephone' do 
	 tel = b.find(:id, "poi_mobile_phone").set("061869997")
	 expect(tel.value).to eq("061869997")
      end
      it 'Web info' do
	 fb = b.find(:id, "poi_facebook_url").set("https://www.facebook.com/Zutikutak/")
	 ig = b.find(:id, "poi_instagram_url").set("https://www.instagram.com/zuti_kutak/?hl=en")
	 tra = b.find(:id, "poi_tripadvisor_url").set("https://www.tripadvisor.com/Restaurant_Review-g294450-d10349973-Reviews-Zuti_Kutak-Sarajevo_Sarajevo_Canton.html")
      	 expect(fb.value).to eq("https://www.facebook.com/Zutikutak/")
	 expect(ig.value).to eq("https://www.instagram.com/zuti_kutak/?hl=en")
	 expect(tra.value).to eq("https://www.tripadvisor.com/Restaurant_Review-g294450-d10349973-Reviews-Zuti_Kutak-Sarajevo_Sarajevo_Canton.html")
      end
      it 'Wireless checkbox' do
	 wifi = b.find(:id, "poi_has_wifi")
	 wifi.click
	 wifi.click
	 #neki expect da vidi je li kliknuto
      end
      it 'Insert photo' do
	 logo = b.find(:id, "fileToUpload")
	 logo.send_keys '/home/linux_amina/Desktop/zutikutak.jpeg'
	 sleep 4
      end
      it 'Kreiraj button' do
	 #b.find(:css, ".btn-success").click
	 #b.find(:css, ".btn-success").click
	 #sleep 7
      #end
      b.find(:id, "ember551").click
      sleep 3
      end
   end
   context 'C1-Search' do
      it 'Searches for an object' do
         element = b.find(:id, "ember564")
         search = element.set("Ambrosia")
         expect(search.value).to eq("Ambrosia")
         b.find(:css, ".iconav-search").click
         sleep 2
         expect(b.text).to include("Kulturalna asocijacija AMBROSIA")
         b.find(:id, "ember551").click
	 sleep 2
      end
   end
end
