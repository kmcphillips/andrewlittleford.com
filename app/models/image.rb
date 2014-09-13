class Image < ActiveRecord::Base
  has_attached_file :file,
    styles: AttachedImage::SIZES,
    default_style: :full,
    whiny: true,
    path: ":rails_root/public/attachments/images/:class/:id/:style_:basename.:extension",
    url: "/attachments/images/:class/:id/:style_:basename.:extension"

  validates_attachment_presence :file
  validates_attachment_size :file, in: 1..7.megabytes
  validates_attachment_content_type :file, content_type: ["image/jpg", "image/jpeg", "image/pjpeg", "image/png", "image/tiff", "image/x-png", "image/gif"]
  validates :sort_order, uniqueness: true, presence: true

  before_validation :set_sort_order, on: :create

  scope :all_active, ->{ where(active: true) }
  scope :all_inactive, ->{ where(active: false) }
  scope :in_order, ->{ order("sort_order ASC") }
  scope :most_recently_updated, ->{ order("updated_at DESC").limit(1) }

  AttachedImage::SIZES.each_key do |key|
    define_method key do
      self.file.url(key)
    end
  end

  def title
    label unless label.strip.blank?
  end

  protected

  def set_sort_order
    self.sort_order = (self.class.order("sort_order DESC").limit(1).first.try(:sort_order) || -1) + 1
  end
end

