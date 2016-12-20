class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id

      subjects = ["History", "English", "Math", "Science", "Language", "Arts", "Elective"]
      subjects.each do |subject|
        @user.requirements.create(subject: subject, years: 0, user_id: @user.id)
      end 

      redirect_to user_path(@user)
    else
      @errors = @user.errors
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:user_type, :first_name, :last_name, :email, :phone_number, :grade_level, :address, :city, :state, :zipcode, :lang_preference, :password, :password_confirmation)
    end


end
