class FavoritesController < ApplicationController
  def index
    @favorites = Favorite.where(user_id: session[:user_id]).includes(:gif)
    @user = User.find(session[:user_id])
  end

  def create
    Favorite.create_favorites(params[:favorites], session[:user_id])
    redirect_to user_favorites_path(session[:user_id])
  end

  def destroy
    Favorite.destroy(params[:id])
    redirect_to user_favorites_path(session[:user_id])
  end
end
