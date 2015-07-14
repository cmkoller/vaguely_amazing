class Purchase < ActiveRecord::Base
  belongs_to :game
  belongs_to :buyer, class_name: "User"
end
