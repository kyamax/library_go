class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:employee_id]

  validates :name, presence: true
  validates :employee_id, presence: true, numericality: {only_integer: true}

  has_many :books
  has_many :schools
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
