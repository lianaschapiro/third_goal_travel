class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end

  def create
    @journal = Journal.new(journal_params)
    @journal.user_id = current_user.id
    if @journal.save
      flash[:notice] = "Journal added"
    else
      flash[:notice] = "Unable to add journal"
    end
    redirect_to user_path(current_user)
  end

  def destroy
    @journal = Journal.find(params[:id])
    @country = @journal.country
    if @journal.destroy
      flash[:notice] = "Journal removed"
    else
      flash[:notice] = "Unable to remove journal"
    end
    redirect_to user_path(current_user)
  end

  private

  def journal_params
    params.require(:journal).permit(:link, :title, :description, :author, :country_id)
  end
end
