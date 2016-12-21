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
    @user = User.find(params[:user_id])
    @requirement = Requirement.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @requirement = Requirement.find(params[:id])
    if @requirement.update(requirement_params)
      redirect_to user_requirements_path(@user)
    else 
      render "index"
    end
  end

private

  def requirement_params
    requirement_params = { years: params[:requirement][:years] }
  end

end