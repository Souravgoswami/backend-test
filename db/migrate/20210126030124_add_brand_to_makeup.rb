class AddBrandToMakeup < ActiveRecord::Migration[6.0]
  def change
    add_reference :makeups, :brand, null: false, index: true
  end
end
