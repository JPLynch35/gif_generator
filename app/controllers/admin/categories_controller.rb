class Admin::CategoriesController < Admin::BaseController
  def index
    @categories = Category.order(:title)
  end

  def new

  end

  def create
    api_instance = GiphyClient::DefaultApi.new
    api_key = "6KjjikGzCZdEMgXtaEt9JUyg7nCjIDY0"
    q = params[:title] # String | Search query term or prhase.
    opts = { 
      limit: 1, # Integer | The maximum number of records to return.
      offset: 0, # Integer | An optional results offset. Defaults to 0.
      rating: "g", # String | Filters results by specified rating.
      lang: "en", # String | Specify default country for regional content; use a 2-letter ISO 639-1 country code. See list of supported languages <a href = \"../language-support\">here</a>.
      fmt: "json" # String | Used to indicate the expected response format. Default is Json.
    }
    begin
      #Search Endpoint
      result = api_instance.gifs_search_get(api_key, q, opts).data.first.images.fixed_height.url
    rescue GiphyClient::ApiError => e
      puts "Exception when calling DefaultApi->gifs_search_get: #{e}"
    end

    if Category.find_by_title(params[:title])
      category_id = Category.find_by_title(params[:title]).id
    else
      Category.create(title: params[:title])
      category_id = Category.last.id
    end

    Gif.create(gif_url: result, category_id: category_id )
    redirect_to admin_categories_path
  end

  def destroy
    category = Category.find(params[:id])
    category.destroy
    redirect_to admin_categories_path
  end
end
