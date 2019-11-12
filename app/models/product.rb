class Product < ApplicationRecord
    def self.to_csv
        attributes = %w{id product_id product_name weave composition color category1 category2 category3 vendor_name}

        CSV.generate(headers: true) do |csv|
            csv << attributes

            all.each do |product|
                csv << attributes.map{ |attr| product.send(attr) }
            end
        end
    end
end
