class CreateLicences < ActiveRecord::Migration[5.2]
  def change
    create_table :licences do |t|
      t.date :acquired_on
      t.date :expires_on
      t.string :country
      t.string :licence_type
      t.timestamps
      t.integer :student_id
    end

    add_foreign_key :licences, :students
  end
end
