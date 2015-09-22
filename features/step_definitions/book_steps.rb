Before do
  visit("/users/sign_up")
  fill_in "Email", :with => "test@example.com"
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
  click_button("Sign up")
  open_email("test@example.com")
  visit_in_email("Confirm my account")
end

Given(/^there are (\d+) books in the database$/) do |arg1|
  @book = create(:book)
end

Given(/^I am logged into the site$/) do
  visit("/users/sign_in")
  fill_in "Email", :with => "test@example.com"
  fill_in "Password", :with => "password"
  click_button("Log in")
end

When(/^I visit the root url$/) do
  visit("/")
end

Then(/^I see a list of books in the database$/) do
  expect(page).to have_content("Bookstore")
end

Then(/^the books are ordered by published date$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^the list of (\d+) books are paginated in pages of (\d+) books per page$/) do |arg1, arg2|
  pending # express the regexp above with the code you wish you had
end

Given(/^some books have been ordered$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I sort by "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Then(/^the books are re\-sorted based on the amount of times they are purchased$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter a book's title into the book search field$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am shown a list of books with that title$/) do
  pending # express the regexp above with the code you wish you had
end