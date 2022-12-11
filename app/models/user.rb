class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:name, :email],
    using: {
      tsearch: { prefix: true }
    }

  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :questions
  has_many :answers
end
