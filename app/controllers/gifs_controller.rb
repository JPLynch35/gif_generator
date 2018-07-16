class GifsController < ApplicationController
  def index
    @categories = Category.all.includes(:gifs)
    unless session[:user_id].nil?
      @favorites = Favorite.where(user_id: session[:user_id])
    end
  end
end
