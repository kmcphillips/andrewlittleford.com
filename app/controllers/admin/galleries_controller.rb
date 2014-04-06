class Admin::GalleriesController < Admin::ApplicationController

  def index
    @gallery = Gallery.singleton
    @title = "Gallery - #{@gallery.name}"
  end

end
