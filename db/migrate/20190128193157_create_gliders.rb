class CreateGliders < ActiveRecord::Migration[5.2]
  def change
    create_table :gliders do |t|
      t.string :type
      t.string :size
      t.string :manufacturer
      t.string :image
      t.string :color_name
      t.string :serial_number
      t.string :year_manufactured

      t.timestamps
    end
  end
end
