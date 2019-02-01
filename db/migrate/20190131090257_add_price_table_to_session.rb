class AddPriceTableToSession < ActiveRecord::Migration[5.2]
  def change
    add_reference :sessions, :price_table, foreign_key: true
  end
end
