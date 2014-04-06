class Admin::PreviewController < ApplicationController
  layout false
  protect_from_forgery :except => :plain

  def plain
  end

end
