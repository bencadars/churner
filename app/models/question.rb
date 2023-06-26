class Question < ApplicationRecord
  has_many :survey_questions
  has_many :answers
  has_many :template_questions
end
