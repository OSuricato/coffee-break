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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path, notice: 'Bookmark was successfully removed.', status: :see_other
  end
  # update/edit
  # destroy

  def edit
  end

  def update
    @product.update(product_params)
    redirect_to product_path(@product)
  end

  def search
    @search_results = Product.where("name ILIKE ?", "%#{params[:search][:query]}%")
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :region, :roast_type, :description, :weight, :price)
  end
end
