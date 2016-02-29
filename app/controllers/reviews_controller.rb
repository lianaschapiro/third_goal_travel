class ReviewsController < ApplicationController
  def index
  end

  def show
    @review = Review.find(params[:id])
    @country = @review.country
    @user = @review.user
    @comment = Comment.new
    @comments = @review.comments.order("created_at DESC")
  end

  def create
    @country = Country.find_by_url_name(params[:country_id])
    @review = @country.reviews.build(review_params)
    @review.user_id = current_user.id
    puts @review.user_id
    if @review.save
      flash[:notice] = "Review added"
    else
      flash[:notice] = "Unable to add review"
    end
    redirect_to country_path(@country)
  end

  def edit
    @review = Review.find(params[:id])
    @user = @review.user
    @country = @review.country
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
