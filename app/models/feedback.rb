class Feedback < ActiveRecord::Base
  validates :name, presence: true
end
