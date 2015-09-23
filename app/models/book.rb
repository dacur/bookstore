class Book < ActiveRecord::Base
  # default_scope { order(published_date: :desc) }
  self.per_page = 25
  
  def self.by_times_purchased
    order(times_purchased: :desc)
  end

  def self.search(search)
    if search
      Book.where("title LIKE ?", "%#{search}%")
    else
      Book.all
    end
  end
end
