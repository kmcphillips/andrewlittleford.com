class Admin::EventsController < ApplicationController
  before_filter :require_login

  def index
    @events = Event.paginate(pagination_params(:order => "created_at DESC"))
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

    if params[:commit] == "Preview"
      @event.valid?
      @preview = true
      render :action => "edit"
    elsif @event.save
      redirect_to(admin_events_url, :notice => 'Event was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @event = Event.find(params[:id])

    if params[:commit] == "Preview"
      @event.attributes = params[:event]
      @event.valid?
      @preview = true
      render :action => "edit"
    elsif @event.update_attributes(params[:event])
       redirect_to(admin_events_url, :notice => 'Event was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

     redirect_to(admin_events_url) 
  end
end
