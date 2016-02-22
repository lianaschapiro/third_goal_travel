class JournalsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @country = Country.find_by_url_name(params[:country_id])
    @journal = @country.journals.build(journal_params)
    if @journal.save
      flash[:notice] = "Journal added"
    else
      flash[:notice] = "Unable to add journal"
    end
    redirect_to country_path(@country)
  end

  def edit
  end

  def update
  end

  private

  def journal_params
    params.require(:journal).permit(:link, :title, :description, :author, :country_id)
  end
end
