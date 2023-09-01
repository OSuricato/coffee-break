class ProductsController < ApplicationController
  # before_action: set_product, only:
  skip_before_action :authenticate_user!, only: [ :index, :index_accessories, :index_promo, :show ]

  def index
    @coffees = Product.where(product_type: "Coffee")
    @pagy, @coffees = pagy @coffees, items: params.fetch(:count, 12)
  end

  def index_accessories
    @accessories = Product.where.not(product_type: "Coffee")
    @pagy, @accessories = pagy @accessories, items: params.fetch(:count, 12)
  end

  def index_promo
    @promos = Product.where(is_promo: true)
    @pagy, @promos = pagy @promos, items: params.fetch(:count, 12)
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

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
    redirect_to root_path, notice: 'Bookmark was successfully removed.', status: :see_other
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
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
    params.require(:product).permit(:name, :region, :roast_type, :description, :weight, :price, :product_type, :is_promo, :photo)
  end
end
