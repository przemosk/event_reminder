class CreateAlerts < ActiveRecord::Migration[6.1]
  def change
    create_table :alerts do |t|
      t.references :event, null: false, foreign_key: true
      t.datetime :remaind_at

      t.timestamps
    end
  end
end
