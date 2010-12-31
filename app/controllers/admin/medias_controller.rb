class Admin::MediasController < ApplicationController
  before_filter :require_login

  def edit
    @kit = Media.find_by_label!(params[:id])
  end

  def update
    @kit = Media.find_by_label!(params[:id])

    if @kit.update_attributes(params[:media])
      redirect_to(admin_blocks_path, :notice => "#{@kit.label.humanize} was successfully updated.")
    else
      render :action => "edit"
    end
  end

end

