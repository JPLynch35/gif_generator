class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, :name, require: true
  has_many :favorites
  has_many :gifs, through: :favorites

  has_secure_password
end
