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

require 'test_helper'

class ChatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
