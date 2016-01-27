Given(/^I have an admin account$/) do
  # Admin.find(email: 'admin@example.com')
end

When(/^I visit the admin panel url$/) do
  visit new_admin_user_session_path
end

When(/^I enter my admin email$/) do
  fill_in 'Email', with: 'admin@example.com'
end

When(/^I enter my admin password$/) do
  fill_in 'Password', with: 'password'
end

Then(/^I see the admin panel$/) do
  visit admin_root_path
end

Given(/^I do not have an admin account$/) do
  # express the regexp above with the code you wish you had
end

Then(/^I see a flash notification that tell me that my email does not exist in the system$/) do
  expect(page).to have_content("Invalid email or password.")
end

Given(/^I am logged into the admin panel$/) do
  visit new_admin_user_session_path
  fill_in 'Email', with: 'admin@example.com'
  fill_in 'Password', with: 'password'
  click_on "Login"
end

Given(/^I am logged into the site$/) do
  visit root_path
  fill_in 'Email', with: 'newuser@test.com'
  fill_in 'Password', with: 'password'
  click_on "Log in"
end

When(/^I visit the admin books url$/) do
  visit admin_books_path
end

When(/^I enter the title "(.*?)"$/) do |title|
  fill_in 'Title', with: title
end

When(/^I enter the price "(.*?)"$/) do |price|
  fill_in "Price", with: price
end

When(/^I enter the published date "(.*?)"$/) do |published_date|
  fill_in "Published date", with: published_date
end

When(/^I enter the author "(.*?)"$/) do |author|
  fill_in "Author", with: author
end

Then(/^I see the book "(.*?)"$/) do |title|
  expect(page).to have_content(title)
end

When(/^I visit the public book index$/) do
  visit books_path
end

Then(/^I see the book published date "(.*?)"$/) do |published_date|
  expect(page).to have_content(published_date)
end

Then(/^I see the book author "(.*?)"$/) do |author|
  expect(page).to have_content(author)
end

Given(/^there is a book named "(.*?)"$/) do |title|
  expect(page).to have_content(title)
end

When(/^I click "(.*?)" for the book "(.*?)"$/) do |button, title|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a prompt requesting that I confirm my decision to delete the book$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I confirm my decision to delete the book$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I don't see "(.*?)"$/) do |title|
  expect(page).not_to have_content(title)
end

Given(/^there is a book named "(.*?)" valued at "(.*?)"$/) do |title, price|
  pending # express the regexp above with the code you wish you had
end

When(/^I change the book name to "(.*?)"$/) do |new_title|
  fill_in 'Title', with: new_title
end

When(/^I change the book price to "(.*?)"$/) do |new_price|
  fill_in 'Price', with: new_price
end
