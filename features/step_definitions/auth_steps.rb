Before do
  visit("/users/sign_up")
  fill_in "Email", :with => "test@example.com"
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
  click_button("Sign up")
  open_email("test@example.com")
  visit_in_email("Confirm my account")
end

Given(/^I have an account on the site$/) do

end

Given(/^My account is confirmed$/) do
  @user = User.where.not(confirmed_at: nil).last
end

When(/^I visit the root url$/) do
  visit("/")
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
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
