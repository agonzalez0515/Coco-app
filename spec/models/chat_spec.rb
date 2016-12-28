require 'rails_helper'

RSpec.describe Chat, type: :model do
    it { should belong_to(:user) }
    it { should validate_presence_of (:body) }
end
