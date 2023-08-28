class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :region
      t.integer :weight
      t.integer :price
      t.string :roast_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
