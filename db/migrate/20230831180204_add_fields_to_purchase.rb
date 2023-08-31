class AddFieldsToPurchase < ActiveRecord::Migration[7.0]
  def change
    add_column :purchases, :address, :string
  end
end
