require "rspec/expectations"
require "selenium-webdriver"
require 'rspec-api-matchers'
require 'rspec'
driver = Selenium::WebDriver.for :firefox

driver.navigate.to "http://www.navigator.ba"

driver.find_element(:id, "ember572").click

#Osnovne informacije"
driver.find_element(:id, "poi_name").send_keys "Žuti kutak"  
driver.find_element(:id, "poi_city_name").send_keys "Sarajevo"
driver.find_element(:id, "poi_zip_code").send_keys "71000"
driver.find_element(:id, "poi_place_id").send_keys "Mala Aleja"
driver.find_element(:id, "poi_house_number").send_keys "15"
driver.find_element(:id, "poi_description").send_keys "Slatke palačinke, slane palačinke,protein palačinke, wafli, sendviči, milkšejkovi. Čekamo vas ! Zaviri u ŽutiKutak"


#Pozicioniranje na mapi
marker = driver.find_element(:css, ".leaflet-marker-icon")
driver.action.drag_and_drop_by(marker, "-800", "250").perform
sleep 1
driver.find_element(:css, ".leaflet-control-zoom-out").click
sleep 1
driver.action.drag_and_drop_by(marker, "-304", "46").perform
driver.action.drag_and_drop_by(marker, "-304", "46").perform
sleep 1
driver.find_element(:css, ".leaflet-control-zoom-in").click
driver.find_element(:css, ".leaflet-control-zoom-in").click
sleep 1
driver.action.drag_and_drop_by(marker, "-24", "22").perform
driver.action.drag_and_drop_by(marker, "-24", "22").perform
sleep 1
driver.find_element(:css, ".leaflet-control-zoom-in").click
sleep 1
driver.action.drag_and_drop_by(marker, "1", "18").perform
sleep 1
#Kategorija objekta
driver.find_element(:id, "ember937").click
driver.find_element(:id, "ember937").click
category_a = driver.find_element(:xpath, "/html/body/div[4]/div/div/div[2]/div/div[1]/div/div[1]/div[1]/div/form/div[2]/div[2]/div[1]/div/div[1]/div/div[2]").click
#category_a = driver.find_element(:css, ".category-selector-row > div:nth-child(2)").click
option = driver.find_element(:css, ".category-selector-row > div:nth-child(2) > select:nth-child(1) > option:nth-child(5)").click
sleep 1
category_b = driver.find_element(:css, ".category-selector-row > div:nth-child(3)").click
option_b = driver.find_element(:css, ".category-selector-row > div:nth-child(3) > select:nth-child(1) > option:nth-child(5)").click

driver.find_element(:css, "input.ui-widget-content").send_keys "pancakes"

#Radno vrijeme
sat = driver.find_element(:id, "btn_day_sat")
sat.click
sat.click
driver.find_element(:id, "btn_day_sun").click
driver.find_element(:id, "working_hours_0_0").send_keys "09:00"
driver.find_element(:id, "working_hours_0_1").send_keys "23:00"
driver.find_element(:css, ".btnAddWorkingHours").click

#Telefon
driver.find_element(:id, "poi_mobile_phone").send_keys "061869997"

#Web
driver.find_element(:id, "poi_facebook_url").send_keys "https://www.facebook.com/Zutikutak/"
driver.find_element(:id, "poi_instagram_url").send_keys "https://www.instagram.com/zuti_kutak/?hl=en"
driver.find_element(:id, "poi_tripadvisor_url").send_keys "https://www.tripadvisor.com/Restaurant_Review-g294450-d10349973-Reviews-Zuti_Kutak-Sarajevo_Sarajevo_Canton.html"

#Wireless checkbox
wifi = driver.find_element(:id, "poi_has_wifi")
wifi.click
wifi.click
#wifi.click

#Fotografija
logo = driver.find_element(:id, "fileToUpload")
logo.send_keys '/home/linux_amina/Desktop/zutikutak.jpeg'

sleep 4

#Button "Kreiraj"
driver.find_element(:css, ".btn-success").click
driver.find_element(:css, ".btn-success").click

sleep 7

#Povratak na pocetnu stranicu
driver.find_element(:id, "ember551").click

#Pretraga
element = driver.find_element(:id, "ember564")
element.send_keys "Ambrosia"
driver.find_element(:class, "iconav-search").click

sleep 5

driver.close
