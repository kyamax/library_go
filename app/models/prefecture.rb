class Prefecture < ApplicationRecord
  has_many :cities
  belongs_to :school

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
