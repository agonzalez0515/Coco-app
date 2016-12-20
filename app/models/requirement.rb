# == Schema Information
#
# Table name: requirements
#
#  id         :integer          not null, primary key
#  subject    :string
#  years      :float
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Requirement < ApplicationRecord
  belongs_to :user
end
