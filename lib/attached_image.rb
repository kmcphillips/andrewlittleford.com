module AttachedImage

  SIZES = { full: "700x560>", thumb: "120x120#", inline: "280x280>", column: "600x500>" }

  def self.included(base)
    base.extend ClassMethods
    base.instance_eval do

      has_attached_file :image,
        styles: AttachedImage::SIZES,
        default_style: :full,
        whiny: true,
        path: ":rails_root/public/attachments/images/:class/:id/:style_:basename.:extension",
        url: "/attachments/images/:class/:id/:style_:basename.:extension"

      validates_attachment_size :image, in: 1..10.megabytes
      validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/pjpeg", "image/png", "image/tiff", "image/x-png", "image/gif"]

      validate :setting_valid_image

      before_save :manage_image

      attr_accessor :previous_image_id, :clear_image

      AttachedImage::SIZES.each_key do |key|
        define_method key do
          self.image.url(key)
        end
      end

    end
  end

  module ClassMethods
  end

  protected

  def setting_valid_image
    errors.add(:base, "cannot send multiple types of image actions") if (image.dirty?) ? (!clear_image.blank? || !previous_image_id.blank?) : (!clear_image.blank? && !previous_image_id.blank?)  # tests if at least two are true
    errors.add(:image, "is not a valid previous image") if !previous_image_id.blank? && !self.class.find_by_id(previous_image_id)
  end

  def manage_image
    self.image.clear if !clear_image.blank?
    self.image = self.class.find_by_id(previous_image_id).image if !previous_image_id.blank?
  end

end
