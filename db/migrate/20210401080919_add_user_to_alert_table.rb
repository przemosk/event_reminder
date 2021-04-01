class AddUserToAlertTable < ActiveRecord::Migration[6.1]
  def change
    add_column :alerts, :user_id, :integer, index: true
  end
end
