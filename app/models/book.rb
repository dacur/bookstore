class Book < ActiveRecord::Base

  def self.by_times_purchased
    order(times_purchased: :desc)
  end

  def self.search(search)
    Book.where("title LIKE ?", "%#{search}%")
  end
end
