class CountriesController < ApplicationController
  def index
  end

  def show
    set_country
    @journals = @country.journals.order("created_at DESC")
    @boardposts = @country.boardposts.order("created_at DESC")
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def set_country
    @country = Country.find_by(url_name: params[:id])
    unless @country
      redirect_to countries_path, notice: "I could not find that country."
    end
  end
end
