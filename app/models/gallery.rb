class Gallery < ActiveRecord::Base

  has_many :images

  validates :name, :presence => true
  validates :path, :presence => true
  validates :sort_order, :presence => true, :uniqueness => true

  scope :sorted, order("sort_order ASC")

  def full_path
    "/galleries/#{path}"
  end

  def last_updated_at
    images.most_recently_updated.first.try(:updated_at)
  end
  
end
