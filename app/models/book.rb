class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :genre
  has_one_attached :image
  has_many :comments
  has_many :likes

  validates :image, presence: true
  validates :book_name, presence: true
  validates :author, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
