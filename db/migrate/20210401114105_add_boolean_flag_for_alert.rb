class AddBooleanFlagForAlert < ActiveRecord::Migration[6.1]
  def change
    add_column :alerts, :sent, :boolean, default: false
  end
end
