class Admin::ImagesController < Admin::ApplicationController

  def index
    @images = Image.in_order
    @title = "Images"
  end

  def create
    image = Image.new(image_params)

    if image.save
      flash[:notice] = 'Image was successfully added.'
    else
      flash[:error] = image.errors.full_messages.to_sentence
    end

    redirect_to admin_images_path
  end

  def update
    image = Image.find(params[:id])

    if image.update_attributes(image_params)
      flash[:notice] = "Image updated."
    else
      flash[:error] = image.errors.full_messages.to_sentence
    end

    redirect_to admin_images_path
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy

    redirect_to admin_images_path
  end

  def sort
    if params[:image].try(:is_a?, Array)
      params[:image].each_with_index do |id, index|
        ActiveRecord::Base.connection.execute("UPDATE images SET sort_order = #{index + 1} WHERE id = #{id.to_i}")
      end
    end

    head :ok
  end

  private

  def image_params
    params.require(:image).permit(:file, :label)
  end

end

