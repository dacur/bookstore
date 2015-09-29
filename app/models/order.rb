class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items

  def total_cents
    # line_items.sum(&:price_cents)
    line_items.inject(0){ |sum, p| sum + p.price_cents }
  end
end
