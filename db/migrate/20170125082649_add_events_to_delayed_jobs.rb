class AddEventsToDelayedJobs < ActiveRecord::Migration[5.0]
  def change
    add_reference :delayed_jobs, :event, index: true 
    add_foreign_key :delayed_jobs, :events
  end
end
