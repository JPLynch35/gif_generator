class Favorite < ApplicationRecord
  validates_presence_of :gif_id, :user_id
  belongs_to :gif
  belongs_to :user
  
end
