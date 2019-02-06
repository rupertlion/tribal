class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
			t.string :title
			t.datetime :start_date
      t.datetime :end_date
      t.integer :status, default: 0
      t.timestamps
    end
  end
end
