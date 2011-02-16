class Admin::GalleriesController < ApplicationController
  before_filter :require_login

  def index
    @gallery = Gallery.singleton
    @title = "Gallery - #{@gallery.name}"
  end

end
