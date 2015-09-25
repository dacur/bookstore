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
  AdminUser.delete_all
end

Then(/^I see a flash notification that tell me that my email does not exist in the system$/) do
  expect(page).to have_content("Invalid email or password")
end

Given(/^I am logged into the admin panel$/) do
  @admin = AdminUser.create(email: "admin@example.com", password: "password", 
    password_confirmation: "password")
    visit("/admin")
    fill_in "Email*", with: "admin@example.com"
    fill_in "Password*", with: "password"
    click_button("Login")
end

When(/^I visit the admin books url$/) do
  visit("/admin/books")
end

When(/^I want to add a book$/) do
  visit("/admin/books/new")
end

When(/^I enter the title "(.*?)"$/) do |title|
  fill_in "Title", with: title
end

When(/^I enter the price "(.*?)"$/) do |price|
  fill_in "Price cents", with: price
end

When(/^I select year "(.*?)"$/) do |year|
  select year, from: "Year"
end

When(/^I select month "(.*?)"$/) do |month|
  select month, from: "Month"
end

When(/^I select day "(.*?)"$/) do |day|
  select day, from: "Day"
end

When(/^I enter the author "(.*?)"$/) do |author|
  fill_in "Author", with: author
end

Then(/^I see the book "(.*?)"$/) do |title|
  expect(page).to have_content(title)
end

When(/^I visit the public book index$/) do
  visit("/")
end

Then(/^I see the book published date "(.*?)"$/) do |date|
  expect(page).to have_content(date)
end

Then(/^I see the book author "(.*?)"$/) do |author|
  expect(page).to have_content(author)
end

Given(/^there is a book named "(.*?)"$/) do |title|
  create(:book, title: title)
end

Given(/^the price of the book is "(.*?)"$/) do |price|
  @book.price_cents = price
end

When(/^I delete the Book with the Title "(.*?)"$/) do |title|
  find('tr', text: title).click_link("Delete")
end

Then(/^I see a prompt requesting that I confirm my decision to delete the book$/) do
  expect(page.driver.browser.switch_to.alert.text).to have_content("Are you sure you want to delete this?")
end

When(/^I confirm my decision to delete the book$/) do
  page.driver.browser.switch_to.alert.accept
end

Then(/^I don't see "(.*?)"$/) do |title|
  expect(page).to_not have_content(title)
end

When(/^I edit the book with the title "(.*?)"$/) do |title|
  find('tr', text: title).click_link("Edit")
end

Given(/^there is a book named "(.*?)" valued at "(.*?)"$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

When(/^I change the book name to "(.*?)"$/) do |title|
  fill_in "Title", with: title
end

When(/^I change the book price to "(.*?)"$/) do |price|
  fill_in "Price cents", with: price
end