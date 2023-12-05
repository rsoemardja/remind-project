class Task < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true


end
