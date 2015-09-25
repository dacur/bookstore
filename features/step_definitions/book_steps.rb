Before do
  @book = create(:book, published_date: Date.tomorrow)
  visit("/users/sign_up")
  fill_in "Email", :with => "test@example.com"
  fill_in "Password", :with => "password"
  fill_in "Password confirmation", :with => "password"
  click_button("Sign up")
  open_email("test@example.com")
  visit_in_email("Confirm my account")
end

When(/^I click "(.*?)" link$/) do |lnk|
  click_link(lnk)
end

When(/^I click the "(.*?)" button$/) do |btn|
  click_button(btn)
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

Then(/^I see a list of books in the database$/) do
  expect(page).to have_content(Book.first.title)
end

Then(/^the books are ordered by published date$/) do  
  expect(page).to have_content(Date.tomorrow)
end

Then(/^the list of (\d+) books are paginated in pages of (\d+) books per page$/) do |total, per_page|
  # Adding + 1 because the table header counts as 1 row
  expect(page.all("table tr").count).to eq(per_page.to_i + 1)
end

Given(/^some books have been ordered$/) do
  create(:book, times_purchased: 1000)
end

Then(/^the books are re\-sorted based on the amount of times they are purchased$/) do
  expect(page).to have_content(1000)
end

When(/^I enter a book's title into the book search field$/) do
  @unique_book = create(:book, title: "Ian is a God")
  fill_in(:search, :with => @unique_book.title)
end

Then(/^I am shown a list of books with that title$/) do
  expect(page).to have_content(@unique_book.title)
end