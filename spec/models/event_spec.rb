require 'rails_helper'

RSpec.describe Event, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:sat) }

  it "has a start time" do
    sat = Sat.create(id: 1, location_name: "Banning High School", address: "1551 N Avalon Blvd #4 Wilmington, CA 90744", date: Date.parse('2017-01-21'))
    event = Event.create(user_id: 1, sat_id:1, completed: false)

    expect(event.start_time).to eq Date.parse('2017-01-21')
    end

    it "has a title" do
      event = Event.create(user_id: 1, sat_id:1, completed: false)
      expect(event.title).to eq "SAT Day"
    end
end
