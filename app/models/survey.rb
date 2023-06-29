class Survey < ApplicationRecord
  STATUS = ["draft", "active", "completed", "archived"]
  belongs_to :user, optional: true
  belongs_to :template, optional: true
  has_many :survey_questions
  has_many :questions, through: :survey_questions
  has_many :answers
  has_many :receivers
  has_many :users, through: :receivers
  validates :status, inclusion: { in: STATUS }
end
