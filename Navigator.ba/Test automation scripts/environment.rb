def open_browser()

 if  RUBY_PLATFORM =~ /i386-mingw32/
  $b = Watir::Browser.new :ff
  $b.goto 'http://navigator:NavigatoR123@dev.navigator.ba'
 
 else
     require 'headless'
     begin
   $headless = Headless.new
   $headless.start
   $client = Selenium::WebDriver::Remote::Http::Default.new
         $client.timeout = 360
   $b = Watir::Browser.start 'http://navigator:NavigatoR123@dev.navigator.ba'
   rescue Timeout::Error
      puts "Timeout Rescue"
    retry
   end
 end

  width = $b.execute_script("return screen.width;")
 height = $b.execute_script("return screen.height;")
  $b.driver.manage.window.move_to(0,0)
  $b.driver.manage.window.resize_to(width,height)
 
 end


def close_browser()

 if RUBY_PLATFORM =~ /i386-mingw32/
  $b.close
 
 else
  require 'headless'
  $b.close
  $headless.destroy
 end

end
