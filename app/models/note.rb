class Note < ApplicationRecord
  belongs_to :user
  # has_one_attached :photo
  has_many_attached :photos

  scope :in_trash, -> { where(in_trash: true) }

  validates :title, presence: true
  validates :description, presence: true

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      all
    end
  end

  def self.sort(sort)
    if sort == 'title'
      order(title: :asc)
    elsif sort == 'created_at'
      order(created_at: :asc)
    end
  end

  def self.sort_by(sort_by)
    if sort_by == 'title'
      order(title: :desc)
    elsif sort_by == 'created_at'
      order(created_at: :desc)
    end
  end

  def self.filter(filter)
    if filter == 'all'
      all
    end
  end

  def self.filter_by(filter_by)
    if filter_by == 'all'
      all
    end
  end
end
