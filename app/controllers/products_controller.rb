class ProductsController < ApplicationController


  def index
    @coffees = Product.all
  end

  def show
    @coffee = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  # create
  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to @product, notice: "Product created succesfully"
    else
      render :new, status: :unprocessable_entity
    end
  end
  # update/edit
  # destroy

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :region, :roast_type, :description, :weight, :price)
  end
end
