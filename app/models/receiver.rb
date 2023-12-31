class Receiver < ApplicationRecord
  belongs_to :survey
  belongs_to :user
  has_many :answers
  validates :user_id, uniqueness: { scope: :survey_id }
end
