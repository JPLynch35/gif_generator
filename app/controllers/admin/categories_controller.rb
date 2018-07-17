class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(:title)
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end
end
