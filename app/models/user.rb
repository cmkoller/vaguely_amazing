class User < ActiveRecord::Base
  has_many :purchases, foreign_key: :buyer_id
  has_many :games, through: :purchases
  has_many :posts, foreign_key: :author_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == "admin"
  end
end
