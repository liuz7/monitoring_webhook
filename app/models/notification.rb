class Notification < ApplicationRecord
  belongs_to :app
  serialize :receivers, Array
  serialize :body, JSON
end
