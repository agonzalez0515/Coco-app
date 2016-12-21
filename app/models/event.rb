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
#

class Event < ApplicationRecord
  belongs_to :sat
  belongs_to :user
end
