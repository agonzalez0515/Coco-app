# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  user_id    :integer
#  message_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :message
  belongs_to :user
end
