class AddNotesToAdditionalFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :additional_flights, :notes, :text
  end
end
