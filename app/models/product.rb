class Product < ApplicationRecord
  belongs_to :user

  has_many :purchases
  validates :product_type, presence: true, length: { minimum: 3 }
  validates :name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 20 }
  validates :region, :roast_type, presence: true, length: { minimum: 4 }
  validates :weight, :price, presence: true
  has_one_attached :photo
end
