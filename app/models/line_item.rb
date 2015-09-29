class LineItem < ActiveRecord::Base
  belongs_to :book
  belongs_to :order

  def price_cents 
    quantity * book.price_cents
  end
end
