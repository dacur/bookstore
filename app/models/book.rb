class Book < ActiveRecord::Base
  default_scope { order(published_date: :desc) }
end
