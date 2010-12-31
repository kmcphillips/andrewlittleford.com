class TracksController < ApplicationController
  layout "player"

  def show
    @track = Track.find(params[:id])
    @tracks = Track.order("sort_order ASC")
    @mp3 = @track.mp3_url(request.url)
  end

end

