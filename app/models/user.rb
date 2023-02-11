class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id
  has_many :posts, foreign_key: :author_id
  validates_presence_of :name
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  def latest_posts
    posts.order(created_at: :desc).limit(3)
  end
end
