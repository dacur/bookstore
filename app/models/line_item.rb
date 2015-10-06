class LineItem < ActiveRecord::Base
  validates :quantity, :book, presence: true

  belongs_to :book
  belongs_to :order

  def price_cents 
    quantity * book.price_cents
  end
end
