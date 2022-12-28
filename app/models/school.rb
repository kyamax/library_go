class School < ApplicationRecord
  has_many :prefectures
  has_many :cities

  validates :name, presence: true
  

end
