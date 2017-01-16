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
    if @user.save
      @user.phone_number = "+1#{@user.phone_number}"
      session[:user_id] = @user.id 
      requirements(@user)
      send_text(@user)
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

    def send_text(user)
      phone_number = user.phone_number
      name = user.first_name
      student_content = "Thank you for signing up with Coco! As a student, you will receive SAT event reminders and tips from this phone number."
      parent_content = "Thank you for signing up with Coco! As a parent, you will receive tips on how to keep your child on track to graduating high school."
      account_sid = ENV["ACCOUNT_KEY"] 
      auth_token = ENV["SECRET_KEY"]
      client = Twilio::REST::Client.new account_sid, auth_token

      if user.user_type == "student"
        message = client.account.messages.create(
          :from => "+14152002640",
          :to => phone_number,
          :body => "Hi #{name}. #{student_content}"
        )
      elsif user.user_type == "parent"
        message = client.account.messages.create(
          :from => "+14152002640",
          :to => phone_number,
          :body => "Hi #{name}. #{parent_content}"
        )
      end 
    end 
end


