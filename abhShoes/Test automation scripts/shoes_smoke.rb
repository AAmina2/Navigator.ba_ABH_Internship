require "rspec/expectations"
require "selenium-webdriver"
require 'rspec-api-matchers'
require 'rspec'
require 'watir'
require 'capybara/rspec'
require 'gmail'
require 'stripe'
require 'rack/test'
include Rack::Test::Methods
require 'rack'
Dir[File.dirname(__FILE__) + '/environment.rb'].each {|file| require file }
#driver = Selenium::WebDriver.for :firefox
b = Capybara::Session.new :selenium

Capybara.ignore_hidden_elements = false

#b.visit "https://morning-bastion-21932.herokuapp.com/"

describe 'Go to abhShoes' do
   
   context 'Register' do
      it "Fills in information" do
	 b.visit "https://morning-bastion-21932.herokuapp.com/"

         b.find(:xpath, '//*[@id="header"]/nav/div/div/div/span/div[3]/a').click
         
         email = b.fill_in "user_email", with: "testingintern20@gmail.com"
         expect(email.value).to eq("testingintern20@gmail.com")
      
         pass = b.fill_in "user_password", with: "atlantbh"
         expect(pass.value).to eq("atlantbh")

         pass_confirmation = b.fill_in "user_password_confirmation", with: "atlantbh"
         expect(pass_confirmation.value).to eq(pass.value)

         #b.find(:id, "formButton").click
      end
   end

   #context 'Confirm email address' do
      #it 'Click confirmation link on email' do
         #b.visit "https://accounts.google.com/signin/v2/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&service=mail&sacu=1&rip=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin"
	 #sleep 2
	 #expect(b.text).to include("Google")
	 #expect(b.text).to include ("Sign in")
	 #b.find(:id, "identifierId").set("testingintern20@gmail.com")
	 #b.find(:id, "identifierNext").click
	 #sleep 3
	 #expect(b.text).to include("Hi Test")
	 #b.find(:xpath, '//*[@id="password"]/div[1]/div/div[1]/input').set("atlant96")
	 #sleep 1
	 #b.find(:id, "passwordNext").click	 
	 #sleep 4
	 #gmail.inbox.find(:unread).click
	 #b.find(:text, "Thanks for signing up for abhShoes!").click	 
	 #b.click_link("/confirm_email")
      #end
   #end

   context 'Login' do 
      it "Login information" do
         b.find(:xpath, '//*[@id="header"]/nav/div/div/div/span/div[1]/a').click
	 expect(b.text).to include("Login to your account")
         email = b.fill_in "email", with: "testingintern20@gmail.com"
         expect(email.value).to eq("testingintern20@gmail.com")

         pass = b.fill_in "password", with: "atlantbh"
         expect(pass.value).to eq("atlantbh")

         b.find(:id, "formButton").click
	 sleep 1
	 expect(b.text).to include("Welcome testingintern20@gmail.com")
      end
   end

   context 'Shoes profile' do
      it 'Choose shoes characteristics'	do
         b.find(:xpath, '//*[@id="indexShoeTable"]/div/div/div[2]/a/div/div/img').click
 	 sleep 2
	 #expect(b.text).to include("Similar products")
         size = b.find(:id, "shoe-form-select").click
         nb = b.find(:xpath, '//*[@id="shoe-form-select"]/option[4]').click
	
         b.find(:id, 'formButtonBuy').click
	 sleep 2
	 expect(b.text).to include("Your basket")        
      end
   end

   context 'Cart and Shipment' do 
      it 'Fills in cart and shipment information' do
         b.find("a", text: "Continue").click
	 sleep 2
	 expect(b.text).to include("Delivery Address")
         delivery = b.find(:id, "name").set("Test")
         expect(delivery.value).to eq("Test")

         address = b.find(:id, "address").set("Bosmal")
         expect(address.value).to eq("Bosmal")

         city = b.find(:id, "city").set("Sarajevo")
         expect(city.value).to eq("Sarajevo")

         region = b.find(:id, "region").set("BIH")
	 expect(region.value).to eq("BIH")

         zip = b.find(:id, "zip").set("71000")
	 expect(zip.value).to eq("71000")

         telephone = b.find(:id, "telephone").set("033333333")
	 expect(telephone.value).to eq("033333333")

         b.find(:css, ".cart-button.btn.cart-button-continue").click
	 sleep 2 
	 expect(b.text).to include("Confirmation and payment")
         b.find(:css, '.stripe-button-el').click
         sleep 3 
      end
   end

    context 'Pay with Stripe' do
       it 'Payment information' do
	 expect(b).to have_css('iframe[name="stripe_checkout_app"]')
	 stripe_frame = b.find('iframe[name="stripe_checkout_app"]')
	 b.within_frame stripe_frame do
            b.find_field('Card number').send_keys("4242424242424242")
            b.find_field('MM / YY').send_keys "01#{DateTime.now.year + 1}"
            b.find_field('CVC').send_keys '123'

            b.find('button[type="submit"]').click
	    end
	    sleep 7
	    expect(b.text).to include("SHIPMENT")
            expect(b.text).to include("Your basket")
	    expect(b.text).to include("Order succesfully placed!")
	    sleep 5
       end
     end

   context 'Logout' do
      it 'Clicks logout button' do
	sleep 2
	b.find("a", text: "LOGOUT").click
	sleep 2
	expect(b.text).to include("Logged out!")
	sleep 2
	b.find("a", text: "abhShoes").click
	sleep 2
	expect(b.text).to include("Featured Products")
	sleep 2
      end
   end
end


   
