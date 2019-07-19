class ChangeGlidersYearManufacturedToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :gliders, :year_manufactured, 'integer USING CAST(year_manufactured AS integer)'
  end
end
