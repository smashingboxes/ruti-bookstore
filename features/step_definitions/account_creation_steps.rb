Given(/^I do not have an account on the site$/) do
end

When(/^I visit the site root path$/) do
  visit root_path
end

When(/^I visit the "(.*?)" page$/) do |page|
  visit page
end

Then(/^I am presented with a login page$/) do
  expect(page).to have_content("Log In")
end

When(/^I click the "(.*?)" link$/) do |link|
  click_on link
end

When(/^I enter my email address$/) do
  fill_in 'Email', with: 'newuser@test.com'
end

When(/^I enter a password with correct confirmation$/) do
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'password'
end

When(/^I click the "(.*?)" button$/) do |button|
  click_on button
end

Then(/^I am told to check my email for a confirmation link$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am sent a confirmation email$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the link in that email$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^My email address becomes confirmed$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter a password with incorrect confirmation$/) do
  fill_in 'Password', with: 'password'
  fill_in 'Password confirmation', with: 'xyz'
end

Then(/^I am notified that my password confirmation does not match$/) do
  expect(page).to have_content("Password confirmation doesn't match Password")
end

When(/^I enter "(.*?)" as my email address$/) do |arg1|
  fill_in 'Email', with: 'newuser'
end

Then(/^I am notified that my email address is invalid\.$/) do
  expect(page).to have_content("Please")
end