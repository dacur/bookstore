FactoryGirl.define do
  factory :order do
    user_id 1
stripe_token "MyString"
completed false
  end

end
