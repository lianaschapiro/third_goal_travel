class RegionsController < ApplicationController
  def index
    @regions = Region.order("name ASC")
  end

  def show
    set_region
    @countries = @region.countries.order("name ASC")
  end

  private

    def set_region
      @region = Region.find_by(url_name: params[:id])
      unless @region
        redirect_to regions_path, notice: "I could not find that region."
      end
    end
end
