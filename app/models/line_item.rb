class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order

  def price 
    quantity * book.price
  end
end
