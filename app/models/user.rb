class User < ApplicationRecord
  belongs_to :booking
  has_one :guest_information
  has_one :guest_preference
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      
end
