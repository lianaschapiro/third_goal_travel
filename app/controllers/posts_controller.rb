class PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def create
    @country = Country.find_by_url_name(params[:country_id])
    @post = @country.posts.build(post_params)
    # coordinates = Geocoder.coordinates(@post.address)
    # @post.latitude = coordinates[0]
    # @post.longitude = coordinates[1]
    @post.save
    redirect_to country_path(@country)
  end

  def edit
  end

  def update
  end


  private
  def post_params
      params.require(:post).permit(:title, :body, :post_type, :latitude, :longitude, :address, :full_address, :user_id, :country_id)
  end
end
