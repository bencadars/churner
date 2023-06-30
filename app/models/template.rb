class Template < ApplicationRecord
  has_many :surveys
  has_many :template_questions
  has_many :questions, through: :template_questions
end
