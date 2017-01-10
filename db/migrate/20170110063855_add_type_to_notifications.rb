class AddTypeToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :messageType, :string, after: :body
  end
end
