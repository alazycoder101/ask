class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  FOLLOW = 'follow'

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name, :email],
    using: {
      tsearch: { prefix: true }
    }
  multisearchable against: [:name, :email]

  extend FriendlyId
  friendly_id :name, use: :slugged

  acts_as_voter
  acts_as_votable

  has_many :questions
  has_many :answers
  has_many :comments

  def follow(item)
    self.likes item, vote_scope: FOLLOW
  end

  def follow?(item)
    voted_for? item, vote_scope: FOLLOW
  end

  def followed_users
    votes.up.where(vote_scope: FOLLOW, votable_type: :User)
  end

  def followed_topics
    votes.up.where(vote_scope: FOLLOW, votable_type: :Topic)
  end

  def followed_questions
    votes.up.where(vote_scope: FOLLOW, votable_type: :Question)
  end
end
