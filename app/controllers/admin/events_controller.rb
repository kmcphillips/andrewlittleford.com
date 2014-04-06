class Admin::EventsController < Admin::ApplicationController

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

    if @event.save
      redirect_to(admin_events_url, :notice => 'Event was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(params[:event])
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
