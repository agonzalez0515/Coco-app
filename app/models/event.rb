# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  sat_id     :integer
#  completed  :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string           default("SAT Day")
#  job        :string
#

class Event < ApplicationRecord
  belongs_to :sat
  belongs_to :user

  # validate :unique_date


  def start_time
    self.sat.date
  end


  # def unique_date
  #   @user = User.find(self.user_id)
  #   @new_event_date = Sat.find(self.sat_id).date
  #   @all_dates = []
  #   @user.sats.each do |sat|
  #     @all_dates.push(sat.date)
  #   end
  #
  #   if @all_dates.include?(@new_event_date)
  #     errors.add(:event, 'You already have an event saved for that date, try again!')
  #   else
  #     self.save
  #   end



end
