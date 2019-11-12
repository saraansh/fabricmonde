class AddDeliveryTimeAirToOrders < ActiveRecord::Migration[5.1]
  def change
    rename_column :orders, :delivery_time, :delivery_time_land
    add_column :orders, :delivery_time_air, :string
  end
end
