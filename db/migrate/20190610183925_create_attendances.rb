class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.integer :day_id
      t.integer :student_id
      t.integer :glider_id

      t.timestamps
    end

    add_foreign_key :attendances, :days
    add_foreign_key :attendances, :students
    add_foreign_key :attendances, :gliders
  end
end
