class Survey < ApplicationRecord
  STATUS = ["draft", "active", "completed", "archived"]
  belongs_to :user, optional: true
  belongs_to :template, optional: true
  has_many :survey_questions
  has_many :questions, through: :survey_questions
  has_many :answers, through: :receivers
  has_many :receivers
  has_many :users, through: :receivers
  validates :status, inclusion: { in: STATUS }

  include PgSearch::Model
  pg_search_scope :search_by_name_and_status_and_description,
    against: [ :name, :status, :description ],
    using: {
      tsearch: { prefix: true }
    }


end
