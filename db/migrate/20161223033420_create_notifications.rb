class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.string :title
      t.string :message
      t.text :receivers, array: true
      t.timestamps
    end
    add_index :notifications, :title
  end
end
