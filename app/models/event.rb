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
#

class Event < ApplicationRecord
  belongs_to :sat
  belongs_to :user

  def start_time
    self.sat.date
  end

end
