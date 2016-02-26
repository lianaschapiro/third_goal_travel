class ReviewsController < ApplicationController
  def index
  end

  def show
    @country = Country.find_by(url_name: params[:id])
    @review = Review.find(params[:id])
    @comment = Comment.new
    review_id = @review.id
    @comments = @review.comments.order("created_at DESC")
  end

  def create
    @country = Country.find_by_url_name(params[:country_id])
    @review = @country.reviews.build(review_params)
    # coordinates = Geocoder.coordinates(@post.address)
    # @post.latitude = coordinates[0]
    # @post.longitude = coordinates[1]
    if @review.save
      flash[:notice] = "Review added"
    else
      flash[:notice] = "Unable to add review"
    end
    redirect_to country_path(@country)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    @country = @review.country
    @review.update(review_params)
    if @review.save
      flash[:notice] = "Thanks for editing"
      redirect_to country_path(@country)
    else
      flash[:notice] = "Unable to edit review"
      render "edit"
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @country = @review.country
    if @review.destroy
      flash[:notice] = "Review removed"
    else
      flash[:notice] = "Unable to remove review"
    end
    redirect_to country_path(@country)
  end

  private
  def review_params
      params.require(:review).permit(:title, :body, :post_type, :latitude, :longitude, :address, :full_address, :user_id, :country_id)
  end
end
