class Answer < ApplicationRecord
  include PgSearch::Model
  acts_as_commentable
  pg_search_scope :global_search,
    against: [:body],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  belongs_to :question
end
