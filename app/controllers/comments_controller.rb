class CommentsController < ApplicationController

  def new
  end

  def create
    @review = Review.find(params[:review_id])
    @country = @review.country
    @comment = @review.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:notice] = "Comment posted"
    else
      flash[:notice] = "Unable to post comment"
    end
    redirect_to country_review_path(@country, @review)
  end

  def destroy
    @review = Review.find(params[:review_id])
    @country = @review.country
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to country_review_path(@country, @review)
  end

  private
  def comment_params
      params.require(:comment).permit(:body, :user_id, :review_id)
  end
end
