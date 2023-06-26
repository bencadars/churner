class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :surveys #as HR
  has_many :surveys_as_receiver, through: :receivers, source: :surveys
  has_many :receivers
end
