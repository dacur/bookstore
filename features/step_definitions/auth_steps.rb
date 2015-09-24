Given(/^I have an account on the site$/) do
  @user = User.last
end

Given(/^My account is confirmed$/) do
  @user = User.where("confirmed_at", true).last
end

When(/^I enter my correct email$/) do
  visit("/")
  fill_in "Email", :with => @user.email
end

When(/^I enter my password$/) do
  fill_in "Password", :with => "password"
end

When(/^I click "(.*?)" button$/) do |btn|
  click_button(btn)
end

Then(/^I am redirected to the book index page$/) do
  expect(page).to have_content("Bookstore")
end

When(/^I enter the wrong password$/) do
  fill_in "Password", :with => "notmypassword"
end

Then(/^I am notified that my password is incorrect$/) do
  expect(page).to have_content("Invalid email or password.")
end
