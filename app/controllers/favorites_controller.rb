class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: current_user).includes(:gif)
    @user = current_user
  end

  def create
    Favorite.create_favorites(params[:favorites], current_user)
    redirect_to user_favorites_path(current_user)
  end

  def destroy
    Favorite.destroy(params[:id])
    redirect_to user_favorites_path(current_user)
  end
end
