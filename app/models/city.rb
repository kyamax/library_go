class City < ApplicationRecord
  belongs_to :prefecture
  belongs_to :school

  

  validates :name, presence: true
end
