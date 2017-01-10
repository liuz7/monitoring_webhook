class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :receivers, :messageType
  belongs_to :app
end
