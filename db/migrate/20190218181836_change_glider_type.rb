class ChangeGliderType < ActiveRecord::Migration[5.2]
  def change
    rename_column :gliders, :type, :type_glider
  end
end
