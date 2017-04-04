require 'selenium-webdriver'
require 'cucumber'
require 'appium_lib'


Given(/^I have installed and launch the GizmoHub app$/) do
  @get_started = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/introNextButton'))}

end

When(/^I click on "([^"]*)" button$/) do |get_started|
  get_started = @get_started
  get_started.click
end

Then(/^I should see "([^"]*)" button$/) do |continue_button|
  continue_button = wait.until{@driver.find_element(:xpath, '//android.widget.Button[2]')}
  @continue = continue_button
end

When(/^I click "([^"]*)" button$/) do |cont_click|
  cont_click = @continue
  cont_click.click
end

Then(/^I should see the "([^"]*)" buttons$/) do |permission_popup|
  permission_popup = @driver.find_element(:xpath, '//android.widget.Button[2]')
  @permission_popup = permission_popup
end

When(/^I click "([^"]*)" buttons three times$/) do |permission_popup|
  3.times do
    @permission_popup.click
  end
end

Then(/^I should see the "([^"]*)" button on Prepare your Gizmo page$/) do |prep_your_giz_next|
  prep_your_giz_next = wait.until{(@driver.find_element(:xpath, '//android.widget.Button[1]'))}
  @prep_your_giz_next = prep_your_giz_next
end

When(/^I click "([^"]*)" button on Prepare your Gizmo page$/) do |prep_your_giz_next|
  @prep_your_giz_next.click
end

Then(/^I should see a "([^"]*)" input\|text field$/) do |gizmo_number_input|
  gizmo_number_input = wait.until{(@driver.find_element(:class, 'android.widget.EditText'))}
  @gizmo_number = gizmo_number_input
end

When(/^I Enter a valid "([^"]*)" and press "([^"]*)"$/) do |gizmo_number, id_your_gizmo_next|
  gizmo_number = @gizmo_number
  gizmo_number.send_keys '6462002348'
  id_your_gizmo_next = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton'))}
  id_your_gizmo_next.click
end

Then(/^I should be redirected to the "([^"]*)" page$/) do |personalize_page|
  personalize_page = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText'))}
  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText').click)}
  wait.until{(@driver.find_element(:id, 'android:id/text1').click)}

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton').click)}
end

When(/^I enter child’s name and select what the child calls you from the dropdown menu and press "([^"]*)" button$/) do |next_button|

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_name').send_keys 'VC200')}

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupColorsSpinner').click)}

  wait.until{(@driver.find_element(:xpath, '//android.widget.LinearLayout[10]').click)}

  next_button = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton'))}
  next_button.click

end

Then(/^I should see "([^"]*)" popup$/) do |skip_popup|
  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton').click)} #setup security PIN Next
  wait.until{(@driver.find_element(:id, 'android:id/button1').click)} #Skip creating a PIN button

end


Then(/^I should see "([^"]*)"field$/) do |security_code|

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_security_code'))}

end

When(/^I enter the "([^"]*)" digits security code and click "NEXT$/) do |code|

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_security_code').send_keys(code))}

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton').click)}

end

Then(/^I should see text containing "([^"]*)"$/) do |arg1|
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/registeringHeader'.text).to eql?'Linking to Your Gizmo')})
  puts "Scenario PASSED!".upcase

end

Then(/^I should see allow contacts popup$/) do
  wait = Selenium::WebDriver::Wait.new :timeout => 240
  if
  allow_contact = wait.until{(@driver.find_element(:id => 'com.android.packageinstaller:id/permission_allow_button').display?)}
    allow_contact.click
  else
    2.times do
      done = wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/bottomRightButton'))}
      done.click
    end

  end
end

Then(/^I may see the app upgrade if there is a new version$/) do
  wait.until{(@driver.find_element(:id => 'com.android.packageinstaller:id/permission_allow_button').click)}
end

Then(/^I should be on the dashboard$/) do
  phone = wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/toolbar_call_imageview'))}
  expect(phone)
  puts "The gizmo was successfully paired to your devices".upcase
end

# Successful gizmo pairng ends

#Unsuccessful gizmo pairing code begins


When(/^I enter expired security code "([^"]*)" and click "NEXT$/) do |expired_code|

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_security_code').send_keys(expired_code))}

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton').click)}

end

Then(/^I should see text "([^"]*)"$/) do |link_message|
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/registeringHeader').text.eql?(link_message))})

end

Then(/^Then I should see text containing "([^"]*)" if the linking fail$/) do |link_error|
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/registeringHeader').text.eql?(link_error))})

end

#Unsuccessfuly gizmo pairing code ends

# Invalid gimo number text field


Then(/^I should see the "([^"]*)" input\|text field$/) do |invalid_gizmo_number|
  invalid_gizmo_number = @driver.find_element(:class => 'android.widget.EditText')
end

# Invalid gizmo number
When(/^I Enter an invalid "([^"]*)" and press "([^"]*)"$/) do |invalid_gizmo_number, id_your_gizmo_next|

  invalid_gizmo_number = wait.until{(@driver.find_element(:class, 'android.widget.EditText'))}
  invalid_gizmo_number.send_keys '6462002'
  id_your_gizmo_next = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton'))}
  id_your_gizmo_next.click

end

# Invalid gizmo number error message
Then(/^I should see the following error message "([^"]*)"$/) do |gizmo_number_error_message|
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/setupInvalidMdnMessage').text).eql? gizmo_number_error_message})
end


# Gizmo with no child name

Then(/^I should see my gizmo "([^"]*)" input\|text field$/) do |my_gizmo_number|
  my_gizmo_number = wait.until{(@driver.find_element(:class, 'android.widget.EditText'))}
end

When(/^I Enter my gizmo number "([^"]*)" and press "([^"]*)"$/) do |my_gizmo_number, my_gizmo_next|
  my_gizmo_number = wait.until{(@driver.find_element(:class, 'android.widget.EditText'))}
  my_gizmo_number.send_keys '6462002323'
  my_gizmo_next = wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton'))}
  my_gizmo_next.click
end

And(/^I select what the child calls you and press next button to continue$/) do
  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupRelationsText').click)}
  wait.until{(@driver.find_element(:id, 'android:id/text1').click)}
  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton').click)}
end

And(/^I leave the childs name empty$/) do
  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/gizmopal_name'))}
end

And(/^I select the color and click next to continue$/) do
  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/setupColorsSpinner').click)}

  wait.until{(@driver.find_element(:xpath, '//android.widget.LinearLayout[10]').click)}

  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton').click)}

end

Then(/^I should see missing name error "([^"]*)" message$/) do |missing_name_error|
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/setupInvalidName').text).eql? missing_name_error})
  success
end

#Scenario for child relationship begins

Then(/^I should be on the relationship page$/) do
  wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/setupRelationsText'))}
  wait.until{(@driver.find_element(:id, 'com.vzw.gizmopal:id/bottomRightButton').click)}

end


Then(/^I should see this message "([^"]*)" if I don't select the relationship$/) do |relationship_error|
  expect(wait.until{(@driver.find_element(:id => 'com.vzw.gizmopal:id/setupInvalidRelationMessage').text).eql? relationship_error})
  success
end

#Scenario for child relationship ends
