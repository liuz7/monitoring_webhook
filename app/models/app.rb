class App < ApplicationRecord
  has_many :notifications
  include Redis::Objects
  counter :notifications_count
  list :redis_notifications, :marshal => true

  def add_notification(notification)
    self.notifications_count.increment
    notification.created_at = Time.now
    notification.updated_at = Time.now
    notification.app_id = self.id
    notification.messageType = 'text' if notification.messageType.nil?
    notification.id = self.notifications_count.value
    self.redis_notifications << notification
    return notification
  end
end