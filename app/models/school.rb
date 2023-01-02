class School < ApplicationRecord
  has_many :prefectures
  has_many :cities

  belongs_to :admin
  belongs_to :user

  validates :name, presence: true
  

end
