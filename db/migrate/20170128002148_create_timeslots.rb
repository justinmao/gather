class CreateTimeslots < ActiveRecord::Migration[5.0]
  def change
    create_table :timeslots do |t|
      t.integer :timeslot_id
      t.integer :event_id
      t.datetime :time
    end
  end
end
