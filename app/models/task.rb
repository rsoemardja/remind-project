class Task < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true

  def hours_remaining
    hours_remaining = ((self.due_date - DateTime.now) / 3600) - 11
    if hours_remaining > 0
      format('%02d', hours_remaining)
    else
      format('%02d', 0)
    end
  end

  def minutes_remaining
    minutes_remaining = ((self.due_date - DateTime.now) % 3600 / 60)
    if minutes_remaining > 0
      format('%02d', minutes_remaining)
    else
      format('%02d', 0)
    end
  end
end
