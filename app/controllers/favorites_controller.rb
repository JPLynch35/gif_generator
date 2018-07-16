class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: session[user_id])
  end
end
