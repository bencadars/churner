class Template < ApplicationRecord
  has_many :surveys
  has_many :template_questions
end
