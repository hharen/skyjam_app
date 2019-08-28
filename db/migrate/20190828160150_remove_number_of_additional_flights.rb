class RemoveNumberOfAdditionalFlights < ActiveRecord::Migration[5.2]
  def change
    remove_column :additional_flights, :number_of_additional_flights, :interger
  end
end
