class Book < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 300 }

  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user
  has_many :book_comments, dependent: :destroy
  has_many :groups, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end