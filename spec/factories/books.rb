FactoryGirl.define do
  factory :book do
    title "Some Title"
    published_date "2015-09-22"
    author "Ian Donovan"
    price_cents "2500"
    price_currency "USD"
  end

end
