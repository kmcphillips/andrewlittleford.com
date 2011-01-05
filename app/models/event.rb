class Event < ActiveRecord::Base
  validates :title, :presence => true
  validates :description, :presence => true
  validates :starts_at, :presence => {:message => "must have a start date"}

  include AttachedImage

  scope :upcoming, lambda { t = Time.now; where("events.starts_at > ?", t.end_of_day).order("starts_at ASC") }
  scope :current,  lambda { t = Time.now; where("((events.ends_at = '' OR events.ends_at IS NULL) AND events.starts_at BETWEEN ? AND ?) OR ((events.ends_at != '' OR events.ends_at IS NOT NULL) AND events.starts_at < ? AND events.ends_at > ?)", t.beginning_of_day, t.end_of_day, t.end_of_day, t.beginning_of_day).order("starts_at DESC") }
  scope :past,     lambda { t = Time.now; where("((events.ends_at = '' OR events.ends_at IS NULL) AND events.starts_at < ?) OR ((events.ends_at != '' OR events.ends_at IS NOT NULL) AND events.ends_at < ?)", t.beginning_of_day, t.beginning_of_day) }

  def sort_by; starts_at; end

  def duration
    ends_at - starts_at if ends_at
  end

  def status
    if upcoming?
      "Upcoming"
    elsif current?
      "Current"
    elsif past?
      "Past"
    end
  end

  def upcoming?
    starts_at > Time.now
  end

  def current?
    ends_at && starts_at < Time.now && ends_at > Time.now
  end

  def past?
    (ends_at && ends_at < Time.now) || (!ends_at && starts_at < Time.now)
  end
end

