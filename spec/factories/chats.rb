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

FactoryGirl.define do
  factory :chat do |f|
    f.body "Hello! I have a question"
    f.user_id 3
  
  end
end
