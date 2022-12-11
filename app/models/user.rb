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
    self.likes item, vote_scope: FOLLOW, duplicate: false
  end

  def unfollow(item)
    self.dislikes item, vote_scope: FOLLOW, duplicate: false
  end

  def follow?(item)
    voted_up_on? item, vote_scope: FOLLOW
  end

  def following_users
    votes.up.where(vote_scope: FOLLOW, votable_type: :User)
  end

  def following_topics
    votes.up.where(vote_scope: FOLLOW, votable_type: :Topic)
  end

  def following_questions
    votes.up.where(vote_scope: FOLLOW, votable_type: :Question)
  end
end
