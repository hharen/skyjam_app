class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :manoeuvres
      t.string :notes
      
      t.integer :attendance_id

      t.timestamps
    end

    add_foreign_key :flights, :attendances
  end
end
