class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(:title)
  end

  def new

  end

  def create
    api_instance = GiphyClient::DefaultApi.new
    api_key = "6KjjikGzCZdEMgXtaEt9JUyg7nCjIDY0"
    opts = { 
      tag: params[:title], # String | Filters results by specified tag.
      rating: "g", # String | Filters results by specified rating.
      fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }
    begin
      #Search Endpoint
      result = api_instance.gifs_random_get(api_key, opts).data
    rescue GiphyClient::ApiError => e
      result = "Error"
    end
    
    unless result.nil?
      if Category.find_by_title(params[:title])
        category_id = Category.find_by_title(params[:title]).id
      else
        Category.create(title: params[:title])
        category_id = Category.last.id
      end

      Gif.create(gif_url: result.image_url, category_id: category_id )
      redirect_to admin_categories_path
    else
      render :new
    end
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end
end
