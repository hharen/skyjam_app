class JoinTableDaysStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :days_students, id: false do |t|
      t.integer :day_id
      t.integer :student_id
    end
  end
end
