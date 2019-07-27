class AddColorsToGliders < ActiveRecord::Migration[5.2]
  def change
    add_column :gliders, :color_background, :string
    add_column :gliders, :color_arc, :string
    add_column :gliders, :color_oval, :string
    remove_column :gliders, :image
  end
end
