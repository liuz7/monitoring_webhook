class AppSerializer < ActiveModel::Serializer
  attributes :id, :pub_id
  has_many :notifications
end