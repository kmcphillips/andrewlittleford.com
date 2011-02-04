class EventsController < ApplicationController

  def index
    @upcoming = Event.upcoming
    @current = Event.current
    @past = Event.past.order("starts_at DESC").limit(PAST_PERFORMANCES)
  end

  def show
    @event = Event.find(params[:id])
  end

end
