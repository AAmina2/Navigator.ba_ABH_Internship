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
   context 'Choose category' do
      it 'Choose categoy on a landing page' do
         b.visit "http://www.navigator.ba"
	 sleep 2
	 element = b.find("a", text: "SARAJEVSKA POZORIŠTA").click
         sleep 2
         expect(b.text).to include("Narodno pozorište")
         b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
      end
   end
   context 'C1-Search-Invalid' do
      it "Searches for an object that don't exist" do
         element = b.find(:css, ".ember-view.ember-text-field.tt-query").set("rezultat")
         expect(element.value).to eq("rezultat")
         b.find(:css, ".iconav-search").click
         sleep 2
         expect(b.text).to include('Žao nam je. Nismo uspjeli pronaći niti jedan rezultat za traženu pretragu.')
         b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
      end
   end

   context 'C1-Search and gallery' do
      it 'Searches for an object' do
         element = b.find(:css, ".ember-view.ember-text-field.tt-query").set("Ambrosia")
         expect(element.value).to eq("Ambrosia")
         b.find(:css, ".iconav-search").click
	 sleep 2
         expect(b.text).to include("Kulturalna asocijacija AMBROSIA")
	 sleep 2
	 b.find(:css, '.name').click
         expect(b.text).to include("Umjetnost i zabava")
	 b.find("img[src*='//navigator-upload-prod.s3.amazonaws.com/attachments/files/000/004/803/medium/factOFF_image.jpg']").click
	 sleep 2
	 b.find(:id, "cboxNext").click
	 sleep 1
	 b.find(:id, "cboxPrevious").click
	 sleep 1
	 b.find(:id, "cboxClose").click
	 sleep 2
         b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
      end
   end  
     #context 'Claim an object - valid + invalid data' do
      #it 'Claim an object' do
         #element = b.find(:css, ".ember-view.ember-text-field.tt-query").set("Ambrosia")
         #expect(element.value).to eq("Ambrosia")
         #b.find(:css, ".iconav-search").click
         #sleep 2
         #expect(b.text).to include("Kulturalna asocijacija AMBROSIA")
	 #b.find(:css, '.name').click
         #expect(b.text).to include("Umjetnost i zabava")
	 #b.find(:css, ".btn.btn-claim").click
	 #b.find(:css, ".btn.btn-claim").click

	 #email_claim = b.find(:css, ".required.emailcheck").set("gmail.com")
	 #expect(email_claim.value).to eq("testingintern20@gmail.com")

	 #phone_claim = b.find(:css, ".required.phonecheck").set("033333333333333")
	 #expect(phone_claim.value).to eq("033333333")
	 #sleep 2
	 #b.find(:css, ".btn.btn-success").click
	 #b.find(:css, ".btn.btn-success").click
	 #sleep 2
         #expect(b.text).not_to include("Poruka uspješno poslana. Navigator tim će Vas kontaktirati u roku od 48 sati.")
         #sleep 2

	 #name_claim = b.find(:css, ".required").set("Test")
         #expect(name_claim.value).to eq("Test")

         #email_claim = b.find(:css, ".required.emailcheck").set("testingintern20@gmail.com")
         #expect(email_claim.value).to eq("testingintern20@gmail.com")

         #phone_claim = b.find(:css, ".required.phonecheck").set("033333333")
         #expect(phone_claim.value).to eq("033333333")
         #sleep 2
         #b.find(:css, ".btn.btn-success").click
         #b.find(:css, ".btn.btn-success").click
         #sleep 2
         #expect(b.text).to include("Poruka uspješno poslana. Navigator tim će Vas kontaktirati u roku od 48 sati.")
         #sleep 2


	 #b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
      #end
   #end

   #context 'Claim an object - ENGLISH' do
      #it 'Claim an object' do
         #sleep 1
         #b.find(:css, ".btn-en.gaEvent").click
         #sleep 2

	 #element = b.find(:css, ".ember-view.ember-text-field.tt-query").set("Ambrosia")
         #expect(element.value).to eq("Ambrosia")
         #b.find(:css, ".iconav-search").click
         #sleep 2
         #expect(b.text).to include("Kulturalna asocijacija AMBROSIA")
	 #b.find(:css, '.name').click
         #expect(b.text).to include("Arts & Entertainment")
	 #b.find(:css, ".btn.btn-claim").click
	 #b.find(:css, ".btn.btn-claim").click
	 #name_claim = b.find(:css, ".required").set("Test")
	 #expect(name_claim.value).to eq("Test")

	 #email_claim = b.find(:css, ".required.emailcheck").set("testingintern20@gmail.com")
	 #expect(email_claim.value).to eq("testingintern20@gmail.com")

	 #phone_claim = b.find(:css, ".required.phonecheck").set("033333333")
	 #expect(phone_claim.value).to eq("033333333")
	 #sleep 2
	 #expect(b.text).to include("Message successfully sent. Navigator team will get back to you in next 48 hours.")
	 #sleep 2
	 #b.find(:css, ".btn-en.gaEvent").click
         #sleep 2
	 #b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
      #end
   #end

   #context 'Suggest changes' do
      #it "Make change in information" do
         #element = b.find(:css, ".ember-view.ember-text-field.tt-query").set("Metropolis Old City")
         #expect(element.value).to eq("Metropolis Old City")
         #b.find(:css, ".iconav-search").click
         #sleep 2
         #expect(b.text).to include('Kundurdžiluk 3')
	 #b.find(:css, '.name').click
	 #sleep 2
	 #expect(b.text).to include('Kafa')
	 #sleep 2
	 #b.find(:css, '.btn.btn-success.btn-suggest-edit').click
         #b.find(:css, '.btn.btn-success.btn-suggest-edit').click
         #expect(b.text).to include('Detalji o objektu')
	 #b.find(:css, ".ember-view.ember-text-area.pull-right").set("Objekat više ne postoji.")
	 #b.find(:css, '.btn.btn-success').click
	 #expect(b.text).to include('Zahvaljujemo Vam na predloženim izmjenama. Vaše izmjene će biti vidljive nakon revizije.')
	 #b.find(:id, 'alertify-ok').click
	 #expect(b.text).to include('Kafa > Metropolis Old City')
         #expect(b.text).to include('Kundurdžiluk 3')
	 #b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
	 #sleep 2
      #end
   #end
   context 'New object' do
      it 'Clicks new object button' do
	 sleep 1
         b.find(:css, ".btn-bs.gaEvent").click
         sleep 2
         b.text.should include('Kreiraj objekat')
         b.find(:css, ".icon.iconav-plus").click
         b.text.should include('Detalji o objektu')
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
      	 sleep 3
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
      #b.find(:id, "ember551").click
      b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click

      sleep 3
      end
   end



   context 'New object - ENGLISH' do
      it 'Clicks new object button' do
         sleep 1
	 b.find(:css, ".btn-en.gaEvent").click
	 sleep 2
	 b.find(:css, ".icon.iconav-plus").click
	 sleep 2
	 b.text.should include('Place Details')
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
         sleep 1
      end
      it 'Choose category' do
         category = b.find(:css, ".category-selector-row > div:nth-child(2)").click
         option = b.find(:css, ".category-selector-row > div:nth-child(2) > select:nth-child(1) > option:nth-child(6)", :visible => false).click
         sleep 1
      end
      it 'Add tag' do
         tag = b.find(:css, "input.ui-widget-content").set("pancakes")
         expect(tag.value).to eq("pancakes")
      	 sleep 3
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
         b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
         b.find(:css, ".btn-bs.gaEvent").click
         sleep 2
      end
   end

   context 'Send a message to the team' do 
      it 'Fill in information' do
	 b.find("span", text: "Predloži ideju - Pošalji komentar").click
	 b.find(:css, '.feedback')
	 b.find(:css, ".required").set("Testni komentar")
	 b.find(:xpath, '//*[@id="feedback"]/div[4]/label[2]/input').click
	 b.find(:xpath, '//*[@id="feedback"]/div[4]/label[2]/input').click
	 b.find(:css, ".btn.green-button").click
	 b.find(:css, ".btn.green-button").click
	 sleep 3
	 expect(b.text).to include("Hvala na poruci! Potrudit ćemo se da što prije reagujemo.")
	 sleep 2
	 b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
      	 sleep 2
      end
   end

   context 'Send a message to the team - ENGLISH' do
      it 'Fills in information' do
	 sleep 1
         b.find(:css, ".btn-en.gaEvent").click
         sleep 2
	 b.find("span", text: "Suggest features - Report a problem").click
         b.find(:css, ".required").set("Testni komentar")
         b.find(:xpath, '//*[@id="feedback"]/div[4]/label[2]/input').click
         b.find(:xpath, '//*[@id="feedback"]/div[4]/label[2]/input').click
         b.find(:css, ".btn.green-button").click
         b.find(:css, ".btn.green-button").click
	 sleep 2
	 expect(b.text).to include("Thank you for your message! We will do our best to make this happen.")
         sleep 2
	 b.find("img[src*='http://www.navigator.ba/assets/logomain.png']").click
         sleep 2
      end
   end

  context 'About Navigator' do
      it 'Open about Navigator' do
	 b.find(:css, ".btn-bs.gaEvent").click
         b.find("a", text:"O Navigatoru").click
         sleep 2
         expect(b.text).to include("Novi koncept i vizuelni identitet")
         sleep 1
	 b.find(:css, ".carousel-control.right").click
         sleep 1
         expect(b.text).to include("Dostupan na svim popularnim uređajima")
         sleep 1
         b.find(:css, ".carousel-control.left").click
         sleep 1
	 b.find(:css, ".carousel-control.left").click
         expect(b.text).to include("Svjež sadržaj")
         sleep 2
         b.find("img[src*='http://www.navigator.ba/assets/about/header_logo.png']").click
      end
   end

   context 'Map' do
      it 'tests map' do
	 sleep 2
         b.find(:css, ".leaflet-control-zoom-in").click
	 sleep 2
	 b.find(:css, ".leaflet-control-zoom-out").click
	 sleep 2
      end
   end

   context 'Atlantbh Website' do
      it 'Clicks About Atlantbh button' do 
         b.find('a', text: '© Atlantbh 2014 OSM contributors', exact: true).click
         sleep 7
      end
   end
  
   context 'Google Play' do
      it 'Clicks Google Play button' do
         b.find("img[src*='http://www.navigator.ba/assets/android_app.png']").click
         sleep 7
      end
   end

   context 'App Store' do
      it 'Clicks App Store button' do
         b.find("img[src*='http://www.navigator.ba/assets/ios_app.png']").click
         sleep 7
      end
   end

   context 'Leaflet' do
      it 'Clicks Leaflet button' do
         b.find('a', text: 'Leaflet', exact: true).click
         sleep 7
       end
   end

end

