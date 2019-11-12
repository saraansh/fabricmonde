json.extract! product, :id, :product_id, :product_name, :weave, :composition, :color, :category1, :category2, :category3, :vendor_name, :created_at, :updated_at
json.url product_url(product, format: :json)
