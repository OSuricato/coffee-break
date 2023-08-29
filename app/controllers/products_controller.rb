class ProductsController < ApplicationController

  def index
    @coffees = Product.all
  end

  def show
    @coffee = Product.find(params[:id])
  end
end
