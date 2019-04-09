class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :student_id
      t.integer :day_id
      t.text :manoeuvres #could this be an array of manoeuvres?
      t.text :notes #random text

      t.timestamps
    end
  end
end
