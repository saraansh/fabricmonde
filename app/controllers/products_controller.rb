class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :edit, :update, :destroy]
    
    def index
        redirect_to root_url, notice: nil
    end
   
    def show
    end

    def new
        @product = Product.new
    end

    def edit
    end
    
    def create
        @product = Product.new(product_params)

        respond_to do |format|
        if @product.save
            format.html { redirect_to root_url, notice: 'Product was successfully created.' }
            format.json { render :show, status: :created, location: @product }
        else
            format.html { render :new }
            format.json { render json: @product.errors, status: :unprocessable_entity }
        end
        end
    end

    def update
        respond_to do |format|
        if @product.update(product_params)
            format.html { redirect_to root_url, notice: 'Product was successfully updated.' }
            format.json { render :show, status: :ok, location: @product }
        else
            format.html { render :edit }
            format.json { render json: @product.errors, status: :unprocessable_entity }
        end
        end
    end

    def destroy
        @product.destroy
        respond_to do |format|
        format.html { redirect_to root_url, notice: 'Product was successfully removed.' }
        format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_product
            @product = Product.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def product_params
            params.require(:product).permit(:product_id, :product_name, :weave, :composition, :color, :category1, :category2, :category3, :vendor_name)
        end
end
