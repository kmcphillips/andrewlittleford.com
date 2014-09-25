class Admin::BlocksController < Admin::ApplicationController

  def index
    @blocks = Block.order("label DESC")
    @medias = Media.all
  end

  def edit
    @block = Block.find(params[:id])
  end

  def update
    @block = Block.find(params[:id])

    if @block.update_attributes(block_params)
      redirect_to(admin_blocks_path, notice: 'Section was successfully updated.')
    else
      render action: "edit"
    end
  end

  private

  def block_params
    params.require(:block).permit(:body, :image, :previous_image_id, :clear_image)
  end

end
