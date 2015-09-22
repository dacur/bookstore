class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.date :published_date
      t.string :author
      t.integer :price_cents, default: 0, null: false
      t.string :price_currency, default: "USD", null: false
  
      t.timestamps null: false
    end
  end
end
