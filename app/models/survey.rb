class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :template
  has_many :survey_questions
  has_many :answers
end
