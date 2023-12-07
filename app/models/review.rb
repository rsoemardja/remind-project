class Review < ApplicationRecord
  belongs_to :task
  validates :rating, presence: true 
end
