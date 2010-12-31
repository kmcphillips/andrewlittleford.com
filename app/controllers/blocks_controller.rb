class BlocksController < ApplicationController
  before_filter :load_block  

  def about
  end

  def contact
  end

  def bio
    @kit = Media.find_by_label!("press_kit")
  end

  def gallery
  end

  def links
    @links = Link.in_order
  end

  protected

  def load_block
    @block = Block.find_by_label(params[:action])
  end

end
