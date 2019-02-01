class CreatePriceTables < ActiveRecord::Migration[5.2]
  def change
    create_table :price_tables do |t|
      t.integer :trainees
      t.integer :price_point

      t.timestamps
    end
  end
end
