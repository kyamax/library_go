class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :admin, optional: true
  belongs_to :book

  validates :content, 
    presence: true,
    length: { maximum: 140 }
end
