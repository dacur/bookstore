class Book < ActiveRecord::Base
  validates :title, :author, :price_cents, presence: true
  validates_numericality_of :price_cents, greater_than: 0
  
  def self.by_times_purchased
    order(times_purchased: :desc)
  end

  def self.search(search)
    Book.where("title LIKE ?", "%#{search}%")
  end
end
