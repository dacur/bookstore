class AddTimesPurchasedToBook < ActiveRecord::Migration
  def change
    add_column :books, :times_purchased, :integer
  end
end
