# I don't care about validating content types. Andrew can upload whatever he wants.
module Paperclip
  class MediaTypeSpoofDetector
    def spoofed?
      false
    end
  end
end
