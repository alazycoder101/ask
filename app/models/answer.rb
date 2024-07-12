class Answer < ApplicationRecord
  include PgSearch::Model
  acts_as_commentable
  acts_as_votable

  pg_search_scope :global_search,
    against: [:body],
    using: {
      tsearch: { prefix: true }
    }

  multisearchable against: [:body]

  belongs_to :user
  belongs_to :question

  after_create :update_question_aggregates
  after_destroy :update_question_aggregates

  def update_question_aggregates
    # TODO: put into background jobs
    question.update_aggregates
  end
end
