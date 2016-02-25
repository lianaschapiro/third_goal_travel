class BoardpostsController < ApplicationController
  def show
    @boardpost = Boardpost.find(params[:id])
  end

  def create
    @country = Country.find_by(url_name: params[:country_id])
    @boardpost = @country.boardposts.build(boardpost_params)
    @boardpost.user_id = current_user.id
    if @boardpost.save
      flash[:notice] = "Your thoughts have been posted"
    else
      flash[:notice] = "Unable to post. Try again?"
    end
    redirect_to country_path(@country)
  end

  def destroy
    @boardpost = Boardpost.find(params[:id])
    @country = @boardpost.country
     if @boardpost.destroy
      flash[:notice] = "Post removed"
    else
      flash[:notice] = "Unable to remove post"
    end
    redirect_to country_path(@country)
  end

  private
  def boardpost_params
    params.require(:boardpost).permit(:title, :body, :user_id, :country_id)
  end
end
