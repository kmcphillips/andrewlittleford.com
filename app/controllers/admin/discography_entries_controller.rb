class Admin::DiscographyEntriesController < Admin::ApplicationController
  def index
    @entries = DiscographyEntry.sorted.paginate(pagination_params)
  end

  def new
    @entry = DiscographyEntry.new
  end

  def edit
    @entry = DiscographyEntry.find_by_permalink!(params[:id])
  end

  def create
    @entry = DiscographyEntry.new(discography_entry_params)

    if @entry.save
      redirect_to(admin_discography_entries_url, notice: 'Discography entry was successfully created.')
    else
      render action: "new"
    end
  end

  def update
    @entry = DiscographyEntry.find_by_permalink!(params[:id])

    if @entry.update_attributes(discography_entry_params)
       redirect_to(admin_discography_entries_url, notice: 'Discography entry was successfully updated.')
    else
      render action: "edit"
    end
  end

  def destroy
    @entry = DiscographyEntry.find_by_permalink!(params[:id])
    @entry.destroy

    redirect_to(admin_discography_entries_url)
  end

  def sort
    if params[:entry].try(:is_a?, Array)
      params[:entry].each_with_index do |id, index|
        ActiveRecord::Base.connection.execute("UPDATE discography_entries SET sort_order = #{index + 1} WHERE id = #{id.to_i}")
      end
    end

    head :ok
  end

  private

  def discography_entry_params
    params.require(:discography_entry).permit(:title, :description, :image, :previous_image_id, :clear_image)
  end
end
