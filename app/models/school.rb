class School < ApplicationRecord
  has_many :prefectures
  has_many :cities

  has_many :admins
  has_many :users

  validates :name, presence: true
  

end
