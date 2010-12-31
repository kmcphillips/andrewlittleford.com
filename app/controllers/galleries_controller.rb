class GalleriesController < ApplicationController

  def index
    @galleries = Gallery.sorted
  end

  def show
    @gallery = Gallery.find_by_path(params[:id])
    @title = "Gallery - #{@gallery.name}"
  end

end

