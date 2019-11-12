class HomeController < ApplicationController
  def index
    if (current_user)
      @products = Product.where('vendor_name = ?', current_user.username)
      respond_to do |format|
        format.html
        format.csv { send_data @products.to_csv, filename: "products-#{Date.today}.csv" }
      end
    end
  end
end
