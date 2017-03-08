class ApplicationsController < ApplicationController
  def index
  	@user = User.new
  end
end
