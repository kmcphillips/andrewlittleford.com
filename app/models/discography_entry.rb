class DiscographyEntry < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  include AttachedImage

  acts_as_permalink

end
