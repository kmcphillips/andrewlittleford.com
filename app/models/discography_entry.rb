class DiscographyEntry < ActiveRecord::Base
  validates :title, presence: true
  validates :description, presence: true

  include AttachedImage

  acts_as_permalink

  scope :sorted, ->{ order(sort_order: "ASC", created_at: "DESC") }

end
