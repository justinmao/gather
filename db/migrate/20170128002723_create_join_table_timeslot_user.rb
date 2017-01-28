class CreateJoinTableTimeslotUser < ActiveRecord::Migration[5.0]
  def change
    create_join_table :timeslots, :users do |t|
      t.index :timeslot_id
      t.index :user_id
      t.integer :value
    end
  end
end
