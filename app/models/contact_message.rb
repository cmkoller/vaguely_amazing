class ContactMessage < ActiveRecord::Base
  validates :email, presence: true
end
