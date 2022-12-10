class Question < ApplicationRecord
  include PgSearch::Model
  include Commentable

  pg_search_scope :global_search,
    against: [:title, :body],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user

  has_many :question_topics
  has_many :topics, through: :question_topics
  has_many :answers
end
