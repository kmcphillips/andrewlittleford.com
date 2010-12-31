class Admin::LinksController < ApplicationController

  def index
    @links = Link.in_order
  end

  def new
    @link = Link.new
  end

  def edit
    @link = Link.find(params[:id])
  end

  def create
    @link = Link.new(params[:link])

    if @link.save
      redirect_to(admin_links_url, :notice => 'Link was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @link = Link.find(params[:id])

    if @link.update_attributes(params[:link])
      redirect_to(admin_links_url, :notice => 'Link was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @link = Link.find(params[:id])
    @link.destroy

    redirect_to(admin_links_url)
  end
  
  def sort
    if params[:link].try(:is_a?, Array)
      params[:link].each_with_index do |id, index|
        ActiveRecord::Base.connection.execute("UPDATE links SET sort_order = #{index + 1} WHERE id = #{id.to_i}")
      end
    end

    render :nothing => true
  end
end
