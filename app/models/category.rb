class Category < ApplicationRecord
  validates_presence_of :title
  has_many :gifs, dependent: :destroy

end
