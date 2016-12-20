class SatsController < ApplicationController

  def index
    @sats = Sat.where(date: Date.parse(params[:date]))
    puts "Found #{@sats.size} SATs on #{@sats.map(&:date).uniq}"
    respond_to do |format|
      format.js {render json: @sats.map(&:attributes)}
    end
  end

end
