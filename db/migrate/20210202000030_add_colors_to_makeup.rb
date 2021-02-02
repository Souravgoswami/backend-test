class AddColorsToMakeup < ActiveRecord::Migration[6.0]
  def change
    add_column :makeups, :color, :string, array: true, default: []
  end
end
