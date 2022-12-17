class Book < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  belongs_to :genre
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user

  validates :image, presence: true
  validates :book_name, presence: true
  validates :genre_id, numericality: { other_than: 1, message: "can't be blank" }

  # def liked_by?(user)
  #   likes.where(user_id: user.id).or(likes.where(admin_id: user.id)).exists?
  # end

  def user_liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

  def admin_liked_by?(admin)
    likes.where(admin_id: admin.id).exists?
  end

  # def self.search(search)
  #   if search != ""
  #     Book.where('book_name LIKE(?)', "%#{search}%")
  #     User.where(grade_id: search[:grade_id])
  #     # User.where('opponent LIKE(?)', "%#{search[:keyword]}%").where(grade_id: search[:grade])
  #   else
  #     Book.order('created_at DESC')
  #   end
  # end

end
