class EventsController < ApplicationController

  def index
    @upcoming = Event.upcoming
    @current = Event.current
  end

  def show
    @event = Event.find(params[:id])
  end

  def archive
    @past = Event.past.order("starts_at DESC")
  end

end
