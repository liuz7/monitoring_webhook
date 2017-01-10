class AddAppIdToNotifications < ActiveRecord::Migration[5.0]
  def change
    add_column :notifications, :app_id, :integer, before: :title
  end
end
