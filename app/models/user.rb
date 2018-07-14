class User < ApplicationRecord
  validates_presence_of :email, :password, :name
  has_many :favorites
  has_many :gifs, through: :favorites
  
end
