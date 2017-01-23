class TipsController < ApplicationController

  def index
    @user = User.new
    @users = User.where(user_type: "parent")
    @tips = Tip.all
    i = 0
    @tips.each do |tip|
        i += 1
      @users.each do |user|
        tip_information = {
          phone_number: user.phone_number,
          name: user.name,
          content: tip.content
        }
        TipJob.set(wait: i.weeks).perform_later(tip_information)
      end
    end
  end

end


#triggered by admin once a year manually
