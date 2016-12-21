class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    p user_params
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      requirements(@user)
      redirect_to user_path(@user)
    else
      @errors = @user.errors.full_messages
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:user_type, :first_name, :last_name, :email, :phone_number, :grade_level, :street_address, :city, :state, :zip_code, :lang_preference, :password, :password_confirmation)
    end

    def requirements(user)
      subjects = ["History", "English", "Math", "Science", "Language", "Arts", "Elective"]
      subjects.each do |subject|
        user.requirements.create(subject: subject, years: 0, user_id: user.id)
      end
    end

end
