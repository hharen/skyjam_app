class CreateGliders < ActiveRecord::Migration[5.2]
  def change
    create_table :gliders do |t|
      t.string :glider_type, null: false
      t.string :size
      t.string :manufacturer
      t.string :image
      t.string :color
      t.string :serial_number
      t.string :year_manufactured

      t.integer :student_id

      t.timestamps
    end

    add_foreign_key :gliders, :students
  end
end
