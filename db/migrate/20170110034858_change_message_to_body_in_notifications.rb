class ChangeMessageToBodyInNotifications < ActiveRecord::Migration[5.0]
  def change
    remove_column :notifications, :message
    add_column :notifications, :body, :text, after: :title
  end
end
