class Link < ActiveRecord::Base

  validates :url, :presence => true, :uniqueness => true
  validate :url_begins_with_protocol

  validates :sort_order, :numericality => {:greater_than => 0, :message => "is not a valid number"}

  scope :in_order, order("sort_order ASC")

  before_validation(:on => :create) do
    self.sort_order = Track.highest_sort_order + 1
  end
  
  after_save :scrub_sort_order

  def display
    title.blank? ? url : title
  end

  protected

  def url_begins_with_protocol
    errors.add(:url, "must begin with 'http://' or 'https://'") unless url =~ /http(s)?:\/\/.+/
  end
  
  def self.highest_sort_order
    Track.order("sort_order DESC").limit(1).first.try(:sort_order).to_i
  end
  
  def scrub_sort_order
    Track.order("sort_order ASC").each_with_index do |track, index|
      track.update_attribute(:sort_order, index + 1) unless track.sort_order == (index + 1)
    end
  end
end
