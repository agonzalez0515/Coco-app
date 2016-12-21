# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body_en    :text
#  body_es    :text
#

class Chat < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
  scope :for_display, -> { order(:created_at).last(50) }
end
