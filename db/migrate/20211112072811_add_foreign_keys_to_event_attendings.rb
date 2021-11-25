class AddForeignKeysToEventAttendings < ActiveRecord::Migration[6.1]
  def change
    drop_table :event_attendings

    create_table :event_attendings do |t|
      t.references :attendee, references: :users, foreign_key: true
      t.references :attended_event, references: :events, foreign_key: true

      t.timestamps
    end
  end
end
