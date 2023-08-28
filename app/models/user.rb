class User < ApplicationRecord
    # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :is_company, :company_name, :register_name, presence: true
  validates :email, presence: true, format: { with: /\A.*@.*\.com\z/ }, uniqueness: { case_sensitive: false }
end
