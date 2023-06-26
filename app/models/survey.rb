class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :template, optional: true
  has_many :survey_questions
  has_many :questions, through:survey_questions
  has_many :answers
  has_many :receivers
end
