class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def new
    @product = Product.find(params[:product_id])
    @purchase = Purchase.new
  end

  def show
    @purchase_item = Purchase.find(params[:id])
    # @purchase = current_user.purchases.build(product_item: @purchase_item)
  end

  def create
    @purchase = Purchase.new(purchase_params)
    @product = Product.find(params[:product_id])
    @purchase.product = @product
    @purchase.user = current_user
    if @purchase.save
      # render :confirmation
      redirect_to @purchase, notice: "Product was succesfully purchased"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:address)
  end
end
