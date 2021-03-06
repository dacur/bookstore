Given(/^I do not have an account on the site$/) do
  User.delete_all
end

When(/^I visit the site root path$/) do
  visit("/")
end

Then(/^I am presented with a login page$/) do
  expect(page).to have_content("Log in")
end

When(/^I enter my email address$/) do
  fill_in "Email", :with => "test@example.com"
end

When(/^I enter a password with correct confirmation$/) do
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
end

When(/^I click "(.*?)"$/) do |lnk|
  click_link(lnk)
end

Then(/^I am told to sign in or sign up before continuing$/) do
  expect(page).to have_content("sign in or sign up before continuing")
end

Then(/^I am sent a confirmation email$/) do
  email = ActionMailer::Base.deliveries.first
  expect(email.from).to eq(["no-reply@smashingboxes.com"])
  expect(email.to).to eq(["test@example.com"])
  expect(email.body).to have_content("confirm your account")
end

When(/^I visit the link in that email$/) do
  open_last_email_for("test@example.com")
  visit_in_email("Confirm my account")
end

When(/^I enter a password with incorrect confirmation$/) do
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "notmypassword"
end

Then(/^I am notified that my password confirmation does not match$/) do
  expect(page).to have_content("Password confirmation doesn't match Password")
end

When(/^I enter "(.*?)" as my email address$/) do |text|
  fill_in "Email", :with => text
end

Then(/^I am notified that my email address is invalid\.$/) do
  expect(page).to have_content("Email is invalid")
end

Then(/^My email address becomes confirmed$/) do
  expect(User.first.confirmed_at).to_not be_nil
end
