class PostsController < ApplicationController
  def index
  end

  def show
    @country = Country.find_by(url_name: params[:id])
    @post = Post.find(params[:id])
  end

  def create
    @country = Country.find_by_url_name(params[:country_id])
    @post = @country.posts.build(post_params)
    # coordinates = Geocoder.coordinates(@post.address)
    # @post.latitude = coordinates[0]
    # @post.longitude = coordinates[1]
    if @post.save
      flash[:notice] = "Review added"
    else
      flash[:notice] = "Unable to add review"
    end
    redirect_to country_path(@country)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @country = @post.country
    @post.update(post_params)
    if @post.save
      flash[:notice] = "Thanks for editing"
      redirect_to country_path(@country)
    else
      flash[:notice] = "Unable to edit review"
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @country = @post.country
    if @post.destroy
      flash[:notice] = "Review removed"
    else
      flash[:notice] = "Unable to remove review"
    end
    redirect_to country_path(@country)
  end

  private
  def post_params
      params.require(:post).permit(:title, :body, :post_type, :latitude, :longitude, :address, :full_address, :user_id, :country_id)
  end
end
