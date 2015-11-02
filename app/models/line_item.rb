class LineItem < ActiveRecord::Base
  validates :quantity, :book, presence: true
  validates_numericality_of :quantity, greater_than: 0

  belongs_to :book
  belongs_to :order

  def price_cents 
    quantity * book.price_cents
  end
end
