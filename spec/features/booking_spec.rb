require 'rails_helper'

RSpec.describe "Bookings", type: :system do
  it "creates a new booking" do
    visit new_booking_path
    
    puts "Current URL: #{page.current_url}"  
    puts "Page HTML after waiting:"
    puts page.html
    
    puts "JavaScript console logs:"
    console_logs = page.evaluate_script("window.consoleLog")
    puts console_logs

    # check if the element exists
    expect(page).to have_selector('#new-booking-component', visible: :all, wait: 10)
    
    # print elements visibility status/dimensions
    script = <<-JAVASCRIPT
      (() => {
        const element = document.getElementById('new-booking-component');
        const darkModeForm = document.getElementById('darkModeForm');
        return {
          newBookingComponentVisibility: element.offsetParent !== null,
          newBookingComponentDimensions: { width: element.offsetWidth, height: element.offsetHeight },
          darkModeFormVisibility: darkModeForm ? darkModeForm.offsetParent !== null : 'Not found',
          darkModeFormDimensions: darkModeForm ? { width: darkModeForm.offsetWidth, height: darkModeForm.offsetHeight } : 'Not found',
          newBookingComponentHTML: element.innerHTML,
          darkModeFormHTML: darkModeForm ? darkModeForm.innerHTML : 'Not found'
        };
      })()
    JAVASCRIPT
    result = page.evaluate_script(script)
    puts "Element details: #{result}"

    # try to find the form within the component
    within "#new-booking-component", visible: false do
      expect(page).to have_selector('form', wait: 10, visible: false)
      
      fill_in "Your First Name", with: "John", visible: false
      fill_in "Your Last Name", with: "Doe", visible: false
      fill_in "Animal's Name", with: "Fluffy", visible: false
      select "Dog", from: "animal_type", visible: false
      fill_in "Hours Requested (2-8)", with: 3, visible: false
      
      # Use execute_script for date input
      tomorrow = Date.tomorrow.strftime('%Y-%m-%d')
      execute_script("document.getElementById('date_of_service').value = '#{tomorrow}'")

      click_button "Submit Booking", visible: false
    end

    expect(page).to have_content("Booking was successfully created")
  end
end
