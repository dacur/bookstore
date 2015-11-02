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
end

When(/^I click the "(.*?)" link$/) do |lnk|
  click_link(lnk)
end

Then(/^I am asked to review the order total$/) do
  expect(page).to have_content("review your order")
end

Then(/^I am shown the order summary$/) do
  expect(page).to have_content("Your order has been placed and will ship soon")
end

Then(/^my credit card is saved for future purchases$/) do
  expect(Order.last.user.stripe_customer_token).to_not be_nil
end

Then(/^I am emailed an order invoice containing the books details, quantity, subtotal, and order total$/) do
  email = open_last_email_for("test@example.com")
  expect(email).to have_content("we received your order")
end

When(/^I enter (\d+) for the quantity$/) do |q|
  fill_in "line_item_quantity", :with => q
end

Then(/^the book is added to my cart with quantity (\d+)$/) do |q|
  expect(LineItem.last.quantity).to eq(q.to_i)
end

Then(/^I see the book in my cart with quantity (\d+)$/) do |arg1|
  expect(page).to have_content(LineItem.last.quantity)
end

When(/^I adjust the quantity of the book to (\d+)$/) do |q|
  visit("/line_items/1/edit")
  fill_in "line_item_quantity", :with => q
  click_button("Update Cart")
end

Given(/^I have a credit card saved on the site$/) do
  User.last.update({:stripe_customer_token => "cus_77FCvDXsN19zJr"})
end

Then(/^I am asked if I want to use my already saved credit card$/) do
  expect(page).to have_content("Credit card has been provided")
end

When(/^I confirm using my saved credit card$/) do
  click_button("Submit Order")
end