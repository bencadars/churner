class Answer < ApplicationRecord
  belongs_to :receiver
  belongs_to :survey
  belongs_to :question
end
