class Order < ApplicationRecord

    def update_delivery_time
        # delay by order type
        addon_days = {'swatch' => 1, 'sample' => 3 , 'bulk' => 15}
        dt_land = dt_air = addon_days[self.order_type.downcase] * 24
        
        dist = self.delivery_distance.to_f

        # update the delivery time for land 
        dt_land += ((2 * dist) / 10).ceil
        dt_land = (dt_land >= 24) ? (dt_land / 24).ceil.to_s + ' days' : dt_land.to_s + ' hours'

        # update the delivery time for air
        if dist < 1000
            dt_air = 'NA'
        else
            dt_air += (dist / 60).ceil
            dt_air = (dt_air >= 24) ? (dt_air / 24).ceil.to_s + ' days' : dt_air.to_s + ' hours'
        end

        self.delivery_time_land = dt_land
        self.delivery_time_air = dt_air
        self.save!
    end

    def self.to_csv
        attributes = %w{id product_code order_type delivery_distance delivery_time_land delivery_time_air}

        CSV.generate(headers: true) do |csv|
            csv << attributes

            all.each do |order|
                csv << attributes.map{ |attr| order.send(attr) }
            end
        end
    end
end
