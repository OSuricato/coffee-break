class AddPromoFieldToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :is_promo, :boolean
  end
end
