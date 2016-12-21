class SatsController < ApplicationController

  def index
    @sats = Sat.all
    if params[:search]
      p @sats = Sat.search(params[:search]).order("created_at DESC")
      redirect_to sats_path
    elsif params[:date]
      @sats = Sat.where(date: Date.parse(params[:date]))
      puts "Found #{@sats.size} SATs on #{@sats.map(&:date).uniq}"

    respond_to do |format|
      #format.js {render json: @sats.map(&:attributes)}
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


