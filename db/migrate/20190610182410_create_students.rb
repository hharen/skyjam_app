class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.integer :additional_flights, null: false, default: 0
      t.string :shv_number
      t.boolean :radio, null: false, default: false

      t.timestamps
    end
  end
end
