class Admin::MediasController < Admin::ApplicationController

  def edit
    @kit = Media.find_by_label!(params[:id])
  end

  def update
    @kit = Media.find_by_label!(params[:id])

    if @kit.update_attributes(media_params)
      redirect_to(admin_blocks_path, notice: "#{@kit.label.humanize} was successfully updated.")
    else
      render action: "edit"
    end
  end

  private

  def media_params
    params.require(:media).permit(:file)
  end
end

