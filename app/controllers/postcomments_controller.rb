class PostcommentsController < ApplicationController
def index
  end

  def show
  end

  def new
  end

  def create
    @boardpost = Boardpost.find(params[:boardpost_id])
    @country = @boardpost.country
    @postcomment = @boardpost.postcomments.build(postcomment_params)
    @postcomment.user_id = current_user.id
    if @postcomment.save
      flash[:notice] = "Comment posted"
    else
      flash[:notice] = "Unable to post comment"
    end
    redirect_to country_boardpost_path(@country, @boardpost)
  end

  def edit
  end

  def update
  end

  private
  def postcomment_params
      params.require(:postcomment).permit(:body, :user_id, :boardpost_id)
  end
end
