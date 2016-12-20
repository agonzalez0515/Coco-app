# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Message < ApplicationRecord
  has_many :comments
  belongs_to :user
end
