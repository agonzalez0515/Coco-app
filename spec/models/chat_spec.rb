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

require 'rails_helper'

RSpec.describe Chat, type: :model do
    it { should belong_to(:user) }
    it { should validate_presence_of (:body) }

    

    expect(chat.for_display).to eq
end
