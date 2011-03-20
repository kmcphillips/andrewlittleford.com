class EventsController < ApplicationController

  def index
    @upcoming = Event.upcoming
    @current = Event.current
    @past = Event.past.order("starts_at DESC")
  end

  def show
    @event = Event.find(params[:id])
  end

end
