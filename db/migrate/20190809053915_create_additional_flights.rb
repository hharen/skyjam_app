class CreateAdditionalFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :additional_flights do |t|
      t.integer :number_of_additional_flights, null: false
      t.date :date

      t.integer :student_id

      t.timestamps
    end

    add_foreign_key :additional_flights, :students
  end
end
