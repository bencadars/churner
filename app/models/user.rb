class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :surveys #as HR
  has_many :surveys_as_receiver, through: :receivers, source: :surveys
  has_many :receivers
  validates :type_of_departure, inclusion: { in: ["resignation", "retirement", "termination", "layoff", "end of contract", "redundancy"] }

  def tenure_in_year
    difference_in_years = (date_of_departure - date_of_integration) /365.0
    (difference_in_years * 10).round.to_f / 10
  end

  include PgSearch::Model
  pg_search_scope :search_by_first_name_and_last_name,
    against: [ :first_name, :last_name ],
    using: {
      tsearch: { prefix: true }
    }

    
end
