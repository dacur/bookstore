Before do
  visit("/users/sign_up")
  fill_in "Email", :with => "test@example.com"
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
  click_button("Sign up")
  open_email("test@example.com")
  visit_in_email("Confirm my account")
  @book = build(:book)
end

Given(/^there are (\d+) books in the database$/) do |amount|
  amount.to_i.times { create(:book) }
  # @published_first = create(:book, published_date: "2015-09-20")
  # @published_last = create(:book, published_date: "2015-09-22") 
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
  expect(page).to have_content(Book.first.title)
end

Then(/^the books are ordered by published date$/) do
  published_first = create(:book, published_date: "2015-09-20")
  published_last = create(:book, published_date: "2015-09-24") 
  expect(Book.last).to eq(published_first)
end

Then(/^the list of (\d+) books are paginated in pages of (\d+) books per page$/) do |total, per_page|
  expect(page).to have_content(@book.price_cents, count: 25)
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