class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if current_user
      @user = User.find(params[:id])
    else
      redirect_to login_path
    end
  end

  def create
    @user = User.new(user_params)    
    @user.phone_number = "+1#{@user.phone_number}"
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
      subjects = {"History": 2, 
                  "English": 4, 
                  "Math": 3, 
                  "Science": 2, 
                  "Language": 2, 
                  "Arts": 1, 
                  "Elective": 1}                  
      subjects.each do |subject, year|
        user.requirements.create(subject: subject, years_required: year, years: 0, user_id: user.id)
      end
    end

end


