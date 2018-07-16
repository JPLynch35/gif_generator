class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.joins(:gif).where(user_id: session[:user_id])
  end
end
