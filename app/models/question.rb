class Question < ApplicationRecord
  include PgSearch::Model

  acts_as_commentable

  pg_search_scope :global_search,
    against: [:title, :body],
    using: {
      tsearch: { prefix: true }
    }

  multisearchable against: [:title, :body]

  belongs_to :user

  has_many :question_topics
  has_many :topics, through: :question_topics
  has_many :answers
end
