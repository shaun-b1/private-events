class CreateEventAttendings < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendings do |t|
      t.index :attendee_id
      t.index :attended_event_id

      t.timestamps
    end
  end
end
