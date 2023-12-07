class Task < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  # has_many :comments, dependent: :destroy
  # has_many :comments, class_name: 'Comment', dependent: :destroy


  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true

  scope :in_trash, -> { where(in_trash: true) }
  scope :not_in_trash, -> { where(in_trash: false) }
  scope :completed, -> { where(completed: true) }
  scope :not_completed, -> { where(completed: false) }

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.filter(filter)
    if filter == 'all'
      all
    elsif filter == 'completed'
      completed
    elsif filter == 'not_completed'
      not_completed
    end
  end

  def self.sort(sort)
    if sort == 'due_date'
      order(due_date: :asc)
    elsif sort == 'title'
      order(title: :asc)
    elsif sort == 'created_at'
      order(created_at: :asc)
    end
  end

  def self.sort_by(sort_by)
    if sort_by == 'due_date'
      order(due_date: :desc)
    elsif sort_by == 'title'
      order(title: :desc)
    elsif sort_by == 'created_at'
      order(created_at: :desc)
    end
  end

  def self.filter_by(filter_by)
    if filter_by == 'all'
      all
    elsif filter_by == 'completed'
      completed
    elsif filter_by == 'not_completed'
      not_completed
    end
  end

  def self.search_by(search_by)
    if search_by
      where('title LIKE ?', "%#{search_by}%")
    else
      all
    end
  end


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

  def formatted_remaining_hours
    hours_remaining = self.hours_remaining.to_i
    format('%02d', hours_remaining % 24)
  end

  def formatted_remaining_days
    hours_remaining = self.hours_remaining.to_i
    format('%02d', hours_remaining / 24)
  end

end
