class GifsController < ApplicationController
  def index
    @gifs = Gif.joins(:category).order('categories.title')
    if session[:user_id]
      @favorites = Favorite.where(user_id: session[:user_id]) unless session[:user_id].nil?
    end
  end
end
