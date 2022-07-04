class User < ApplicationRecord
  has_many :payments
  has_many :catagories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
	validates :name, presence:true, length:{in:3..50}
end
