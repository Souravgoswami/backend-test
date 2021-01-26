class CreateBrand < ActiveRecord::Migration[6.0]
  def change
    create_table :brands do |t|
      t.string :name
    end
  end
end
