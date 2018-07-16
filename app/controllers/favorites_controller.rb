class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.all.where(user_id: session[user_id])
  end
end