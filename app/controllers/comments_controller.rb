class CommentsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @country = Country.find_by(url_name: params[:id])
    @review = Review.find(params[:review_id])
    @comment = @review.comments.build(comment_params)
    if @comment.save
      redirect_to root_path
    end
  end

  def edit
  end

  def update
  end
end
