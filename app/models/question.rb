class Question < ApplicationRecord
  include PgSearch::Model

  acts_as_commentable

  pg_search_scope :global_search,
    against: [:title, :body],
    using: {
      tsearch: { prefix: true }
    }

  multisearchable against: [:title, :body]

  scope :followed_by, lambda {|user| liked_by(user, vote_scope: User::FOLLOW) }
  scope :favored, lambda { order(views_count: :desc) }

  belongs_to :user

  acts_as_votable

  has_many :question_topics
  has_many :topics, through: :question_topics
  has_many :answers

  def view!
    # let DB handle the racing conditions
    increment!(:views_count)
  end

  def update_aggregates
    update_columns(
      answers_count: answers.count,
      comments_count: comments.count
    )
    reload
  end
end
