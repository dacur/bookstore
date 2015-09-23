# require "pry-byebug"
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
end

Given(/^I am logged into the site$/) do
  visit("/users/sign_in")
  fill_in "Email", :with => "test@example.com"
  fill_in "Password", :with => "password"
  click_button("Log in")
end

When(/^I visit the root url$/) do
  create(:book, published_date: "2015-09-27")
  visit("/")
end

Then(/^I see a list of books in the database$/) do
  expect(page).to have_content(Book.first.title)
end

Then(/^the books are ordered by published date$/) do  
  expect(page).to have_content("2015-09-27")
end

Then(/^the list of (\d+) books are paginated in pages of (\d+) books per page$/) do |total, per_page|
  expect(page).to have_content("Ian", count: 25)
end

Given(/^some books have been ordered$/) do
  @books = Book.all 
  @found = @books.select {|b| b.times_purchased != 0}
  expect(@found.count).to_not eq(0) # what should go in this nested given?
end

When(/^I click "(.*?)" link$/) do |link|
  create(:book, times_purchased: 1000)
  click_link(link)
end

Then(/^the books are re\-sorted based on the amount of times they are purchased$/) do
  expect(page).to have_content(1000)
end

When(/^I enter a book's title into the book search field$/) do
  create(:book, title: "Stuff Ian Says")
  fill_in(:search, :with => "Stuff Ian Says")
end

When(/^click the "(.*?)" button$/) do |btn|
  click_button(btn)
end

Then(/^I am shown a list of books with that title$/) do
  expect(page).to have_content("Stuff Ian Says")
end