class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:grade_id, :class_num_id, :number_id]

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :grade
  belongs_to :class_num
  belongs_to :number

  validates :grade_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :class_num_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :number_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :name, presence: true

  has_many :books
  has_many :schools
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_books, through: :likes, source: :book

  
  def email_required?
    false
  end

  def email_changed?
    false
  end

end
