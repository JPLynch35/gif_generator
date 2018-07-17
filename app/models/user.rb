class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, :name, :role, require: true
  has_secure_password
  has_many :favorites
  has_many :gifs, through: :favorites
  enum role: ['default', 'admin']
end
