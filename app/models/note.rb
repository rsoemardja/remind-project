class Note < ApplicationRecord
  belongs_to :user
  # has_one_attached :photo
  has_many_attached :photos
  
end
