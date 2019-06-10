class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date :date, null: false
      t.string :instructor, null: false
      t.string :assistant
      t.string :takeoff

      t.timestamps
    end
  end
end
