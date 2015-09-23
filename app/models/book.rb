class Book < ActiveRecord::Base
  default_scope { order(published_date: :desc) }
  self.per_page = 25
end
