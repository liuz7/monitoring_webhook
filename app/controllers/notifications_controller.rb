class NotificationsController < ApplicationController

  def index
    app = App.find_by_pub_id(params[:app_pub_id])
    if app.nil?
      render_error(app, :unprocessable_entity)
    else
      render json: app.redis_notifications, status: :ok
    end
  end

  def create
    app = App.find_by_pub_id(params[:app_pub_id])
    if !app.nil?
      notification = Notification.new(notification_params)
      new_notification = app.add_notification(notification)
      render json: notification, status: :created
      NotificationJob.perform_later new_notification.to_json
    else
      render_error({"error": "no app found"}, :unprocessable_entity)
    end
  end

  def delete
    app = App.find_by_pub_id(params[:app_pub_id])
    app.redis_notifications.clear
    render status: 204
  end

  private

  def notification_params
    params.require(:notification).permit!
  end
end
