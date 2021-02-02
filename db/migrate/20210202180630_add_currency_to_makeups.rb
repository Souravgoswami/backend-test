class AddCurrencyToMakeups < ActiveRecord::Migration[6.0]
  def change
    add_column :makeups, :currency, :string
  end
end
