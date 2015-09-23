class Book < ActiveRecord::Base
  self.per_page = 25
  
  def self.by_times_purchased
    order(times_purchased: :desc)
  end
end
