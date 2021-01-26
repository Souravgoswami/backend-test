class CreateMakeup < ActiveRecord::Migration[6.0]
  def change
    create_table :makeups do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :image_link
    end
  end
end
