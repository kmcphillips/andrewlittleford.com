class BlocksController < ApplicationController
  before_filter :load_block

  def contact
  end

  def bio
  end

  def gallery
    @images = Image.in_order
  end

  def links
    @links = Link.in_order
  end

  def discography
    @entries = DiscographyEntry.sorted
  end

  protected

  def load_block
    @block = Block.find_by_label(params[:action])
  end

end
