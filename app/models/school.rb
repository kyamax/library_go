class School < ApplicationRecord
  has_many :prefectures
  has_many :cities

  belongs_to :admin, optional: true
  belongs_to :user, optional: true

  validates :name, presence: true
  

end
