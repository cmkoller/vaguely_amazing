class User < ActiveRecord::Base
  has_many :purchases, foreign_key: :buyer_id
  has_many :games, through: :purchases

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
