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

  belongs_to :user

  acts_as_votable

  has_many :question_topics
  has_many :topics, through: :question_topics
  has_many :answers

  def view!
    increment!(:views_count)
  end
end
