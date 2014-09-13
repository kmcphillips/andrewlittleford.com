class Media < ActiveRecord::Base
  LABELS = ["press_kit"]

  validates :label, inclusion: LABELS, uniqueness: true

  has_attached_file :file,
    whiny: true,
    path: ":rails_root/public/attachments/media/:class/:id/:style_:basename.:extension",
    url: "/attachments/media/:class/:id/:style_:basename.:extension"

  validates_attachment_size :file, in: 1..10.megabytes

  do_not_validate_attachment_file_type :file

  def to_param
    label
  end

  def self.press_kit
    find_by_label!("press_kit")
  end

end
