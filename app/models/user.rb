class User < ApplicationRecord
  has_secure_password
  has_many :recipes
  has_many :sub_styles, -> { distinct }, through: :recipes
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :password_confirmation, presence: true


  def self.users_with_most_recipes

  end


end
