class Event < ActiveRecord::Base
  validates :title, :presence => true
  validates :description, :presence => true
  validates :starts_at, :presence => {:message => "must have a start date"}

  include AttachedImage

  scope :upcoming, lambda { t = Time.now; where("events.starts_at > ?", t.end_of_day).order("starts_at ASC") }
  scope :current,  lambda { t = Time.now; where("events.starts_at BETWEEN ? AND ?", t.beginning_of_day, t.end_of_day).order("starts_at DESC") }
  scope :past,     lambda { t = Time.now; where("events.starts_at < ?", t.beginning_of_day).order("starts_at DESC") }

  def sort_by; starts_at; end

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
    starts_at > Time.now.end_of_day
  end

  def current?
    (Time.now.beginning_of_day..Time.now.end_of_day).include? starts_at
  end

  def past?
    starts_at < Time.now.beginning_of_day
  end
end

