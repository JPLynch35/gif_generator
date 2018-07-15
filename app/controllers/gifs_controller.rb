class GifsController < ApplicationController
  def index
    @categories = Category.all.includes(:gifs)
  end

end