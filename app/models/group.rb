class Group < ApplicationRecord
  has_one_attached :image
  belongs_to :book
  belongs_to :user

  has_many :group_users
  has_many :users, through: :group_users

  validates :name, presence: true
  validates :introduction, presence: true
end
