class Group < ApplicationRecord
  has_one_attached :image
  belongs_to :book
  belongs_to :user

  has_many :group_users
  has_many :users, through: :group_users
  
  def includes_user?(user)
    group_users.exists?(user_id: user.id)
  end

  def owned_by?(current_user)
    user.id == current_user.id
  end

  validates :name, presence: true
  validates :introduction, presence: true
end
