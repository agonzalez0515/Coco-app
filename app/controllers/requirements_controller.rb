class RequirementsController < ApplicationController

  def information
  end

  def index
    userid=current_user.id
    @requirements = Requirement.where(user_id: userid)
  end

  def new
    @requirement = Requirement.new
  end

  def create

  end

  def show
  end

  def edit
  end

  def update
  end

private

  def requirement_params
  end

end
