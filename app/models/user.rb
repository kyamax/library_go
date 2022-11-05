class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:grade_id, :class_num_id, :number_id]

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :name, presence: true
  validates :grade_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :class_num_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :number_id, numericality: { other_than: 1, message: "can't be blank" }

  has_many :books
  has_many :comments
  belongs_to :grade
  belongs_to :class_num
  belongs_to :number

end
