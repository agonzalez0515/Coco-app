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
#  topic_id   :integer
#

class Message < ApplicationRecord
  has_many :comments
  has_many :tags
  belongs_to :user
  belongs_to :topic

  validates_presence_of :title
  validates_presence_of :body
end
