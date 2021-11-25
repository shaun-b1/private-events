class FixEventAttendingTable < ActiveRecord::Migration[6.1]
  def change
    drop_table(:event_attendings)
  end
end
