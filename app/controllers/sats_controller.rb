class SatsController < ApplicationController
  # include EventHelper
  def index
    if params[:date]
      @sats = helpers.close_by_sats(params[:date], params[:user_lat], params[:user_long]).take(10)

    respond_to do |format|
      format.js {render json: @sats}
      format.html {render :index}
      end
    end
  end

  # def locationsList
  #   # Approach 3
  #   # make a new route
  #   # it renders the SATlocation list partial
  # end

end
