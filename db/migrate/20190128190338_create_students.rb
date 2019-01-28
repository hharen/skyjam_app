class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :n_flights
      t.string :shv_number
      t.boolean :radio
      t.string :glider

      t.timestamps
    end
  end
end
