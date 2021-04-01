class EventParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :participants do |t|
      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
