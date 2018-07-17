class Favorite < ApplicationRecord
  validates_presence_of :gif_id, :user_id
  validates_uniqueness_of :gif_id, scope: :user_id
  belongs_to :gif
  belongs_to :user

  def self.create_favorites(gifs_list, user_id)
    gifs_list.each do |gif_id|
      Favorite.create!(gif_id: gif_id.to_i, user_id: user_id)
    end
  end
end
