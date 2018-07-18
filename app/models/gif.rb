class Gif < ApplicationRecord
  validates_presence_of :category_id, :gif_url
  belongs_to :category
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

end
