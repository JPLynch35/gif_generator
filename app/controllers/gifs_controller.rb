class GifsController < ApplicationController
  def index
    @gifs = Gif.joins(:category).order('categories.title')
    @favorites = Favorite.where(user_id: session[:user_id]) unless current_user.nil?
  end
end
