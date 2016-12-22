class RequirementsController < ApplicationController

  def information
  end

  def index
    userid=current_user.id
    @requirements = Requirement.where(user_id: userid).reorder('id')
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

    respond_to do |format|
      format.js do 
        @requirement.update(requirement_params)
        render 'update'
      end 
    end 
  end
  
  def decrease_years
    @user = User.find(params[:user_id])
    @requirement = Requirement.find(params[:id])

    respond_to do |format|
      format.js do 
        @requirement.update(decrease_requirement_params)
        render 'update'
      end 
    end
  end 

private

  def requirement_params
    current_years = @requirement.years
    requirement_params = { years: (current_years + 1) }
  end

  def decrease_requirement_params
    current_years = @requirement.years
    decrease_requirement_params = {years: (current_years - 1)}
  end 

end