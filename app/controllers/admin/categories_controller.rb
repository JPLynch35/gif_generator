class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(:title)
  end
end
