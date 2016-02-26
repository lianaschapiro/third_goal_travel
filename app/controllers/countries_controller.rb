class CountriesController < ApplicationController
  def index
    @countries = Country.order("name ASC")
  end

  def show
    set_country
    @journal = Journal.new
    @journals = @country.journals.order("created_at DESC")
    @boardpost = Boardpost.new
    @boardposts = @country.boardposts.order("created_at DESC")
    @review = Review.new
    if params[:search]
      @reviews = Review.search(params[:search]).order("created_at DESC")
    else
      @reviews = @country.reviews.order("created_at DESC")
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
    def set_country
      @country = Country.find_by(url_name: params[:id])
      unless @country
        redirect_to countries_path, notice: "I could not find that country."
      end
    end
end
