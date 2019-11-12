class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :product_code
      t.string :order_type
      t.string :delivery_distance
      t.string :delivery_time

      t.timestamps
    end
  end
end
