class Admin::EventsController < Admin::ApplicationController
  def index
    @events = Event.order("created_at DESC").paginate(pagination_params)
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to(admin_events_url, notice: 'Event was successfully created.')
    else
      render action: "new"
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
       redirect_to(admin_events_url, notice: 'Event was successfully updated.')
    else
      render action: "edit"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to(admin_events_url)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :starts_at, :image)
  end
end
