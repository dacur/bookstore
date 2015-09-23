
FactoryGirl.define do
dates = ["2015-09-15", "2015-09-20", "2015-09-25"]
price = [2500, 1900, 2300, 1000, 750]
purchased = [0,1,2,3,4,5,6,7]
  factory :book do
    title "Some Title"
    published_date { dates.sample }
    author "Ian Donovan"
    price_cents { price.sample }
    price_currency "USD"
    times_purchased { purchased.sample }
  end

end
