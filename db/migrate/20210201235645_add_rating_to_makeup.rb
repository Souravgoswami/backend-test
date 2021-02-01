class AddRatingToMakeup < ActiveRecord::Migration[6.0]
  def change
    add_column :makeups, :rating, :float
  end
end
