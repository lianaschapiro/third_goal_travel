class BoardpostsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @country = Country.find_by(url_name: params[:id])
    @boardpost = @country.boardposts.build(boardpost_params)
    @boardpost.user = current_user
    if @boardpost.save
      flash[:notice] = "Boardpost added"
    else
      flash[:notice] = "Unable to add Boardpost"
    end
    redirect_to country_path(@country)
  end
  end

  def edit
  end

  def update
  end

  private
  def boardpost_params
    params.require(:boardpost).permit(:title, :body, :user_id, :country_id)
  end
end
