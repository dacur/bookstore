class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :stripe_token
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
