class CreateTableEventAttendings < ActiveRecord::Migration[6.1]
  def change
    create_table :event_attendings do |t|
      t.references :attendee, foreign_key: { to_table: :users }, index: true
      t.references :attended_event, foreign_key: { to_table: :events }, index: true

      t.timestamps
    end
  end
end
