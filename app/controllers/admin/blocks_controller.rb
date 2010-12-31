class Admin::BlocksController < ApplicationController
  before_filter :require_login

  def index
    @blocks = Block.order("label")
    @medias = Media.all
  end

  def edit
    @block = Block.find(params[:id])
  end

  def update
    @block = Block.find(params[:id])

    if @block.update_attributes(params[:block])
      redirect_to(admin_blocks_path, :notice => 'Section was successfully updated.')
    else
      render :action => "edit"
    end
  end

end

