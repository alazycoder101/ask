class QuestionTopic < ApplicationRecord
  belongs_to :topic
  belongs_to :question
end
