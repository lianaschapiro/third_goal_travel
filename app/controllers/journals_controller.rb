class JournalsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    # @boat = Boat.find(params[:boat_id])
    # @job = @boat.jobs.build(job_params)
    # @job.user = current_user
    # @journal = Journal.new(journal_params)

    @country = Country.find_by(url_name: params[:id])
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
