class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :product_id
      t.string :product_name
      t.string :weave
      t.string :composition
      t.string :color
      t.string :category1
      t.string :category2
      t.string :category3
      t.string :vendor_name

      t.timestamps
    end
    add_index :products, :product_id, unique: true
  end
end
