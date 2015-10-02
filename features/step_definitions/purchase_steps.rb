Given(/^there are some books in the database$/) do
  100.times { create(:book) }
end

When(/^I click on a book$/) do
  first(".book-row").click_link("Title")
end

Then(/^the book is added to my cart$/) do
  expect(page).to have_content(LineItem.last.book.title)
end

When(/^I visit my cart$/) do
  visit('/cart')
end

Then(/^I see the book in my cart$/) do
  expect(page).to have_content(LineItem.last.book.title)
end

Then(/^I am asked for my shipping address$/) do
  expect(page).to have_content("Shipping Address")
end

When(/^I enter my shipping address$/) do
  fill_in "Shipping Address", :with => "123 Main Street"
end

Then(/^I am asked for my billing address$/) do
  expect(page).to have_content("Billing Address")
end

When(/^I enter my billing address$/) do
  fill_in "Billing Address", :with => "456 South Street"
end

Then(/^I am asked for my credit card$/) do
  expect(page).to have_content("Credit Card Number")
end

When(/^I enter my credit card$/) do
  fill_in "Credit Card Number", :with => 4242424242424242
  fill_in "Security Code on Card (CVV)", :with => 123
  select "1 - January", :from => "card_month" 
  select "2020", :from => "card_year" 
  # byebug
end

Then(/^I am asked to review the order total$/) do
  expect(page).to have_content("review your order")
end

Then(/^I am shown the order summary$/) do
  expect(page).to have_content("Order Confirmation")
end

Then(/^my credit card is saved for future purchases$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am emailed an order invoice containing the books details, quantity, subtotal, and order total$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I enter (\d+) for the quantity$/) do |q|
  # byebug
  fill_in "line_item_quantity", :with => q
end

Then(/^the book is added to my cart with quantity (\d+)$/) do |q|
  expect(LineItem.last.quantity).to eq(q)
end

Then(/^I see the book in my cart with quantity (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

When(/^I adjust the quantity of the book to (\d+)$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end

Given(/^I have a credit card saved on the site$/) do
  pending # express the regexp above with the code you wish you had
end

Then(/^I am asked if I want to use my already saved credit card$/) do
  pending # express the regexp above with the code you wish you had
end

When(/^I confirm using my saved credit card$/) do
  pending # express the regexp above with the code you wish you had
end