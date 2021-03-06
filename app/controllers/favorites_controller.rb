class FavoritesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @favorites = Favorite.where(user_id: @user).includes(:gif)
  end

  def create
    if params[:favorites]
      @user = User.find(params[:user_id])
      Favorite.create_favorites(params[:favorites], @user)
      redirect_to user_favorites_path(@user)
    else
      redirect_to gifs_path
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    Favorite.destroy(params[:id])
    redirect_to user_favorites_path(@user)
  end
end
