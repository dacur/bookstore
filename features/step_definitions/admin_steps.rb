Given(/^I have an admin account$/) do
  @admin = AdminUser.create(email: "admin@example.com", password: "password", 
    password_confirmation: "password")
  # byebug
end

When(/^I visit the admin panel url$/) do
  visit("/admin/login")
end

When(/^I enter my admin email$/) do
  fill_in "Email*", with: "admin@example.com"
end

When(/^I enter my admin password$/) do
  fill_in "Password*", with: "password"
end

When(/^I click submit$/) do
  click_button("Login")
end

Then(/^I see the admin panel$/) do
  expect(page).to have_content("Dashboard")
end

Given(/^I do not have an admin account$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a flash notification that tell me that my email does not exist in the system$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I am logged into the admin panel$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the admin books url$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter the title "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I enter the price "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I enter the published date "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I enter the author "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the book "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I visit the public book index$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the book published date "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see the book author "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^there is a book named "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^the price of the book is "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^I see a prompt requesting that I confirm my decision to delete the book$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I confirm my decision to delete the book$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I don't see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^there is a book named "(.*?)" valued at "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I change the book name to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I change the book price to "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end