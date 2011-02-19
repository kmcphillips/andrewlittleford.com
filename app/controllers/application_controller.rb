class ApplicationController < ActionController::Base
  protect_from_forgery

  include Authentication

  include ApplicationHelper

  ## Handle custom dynamic errors
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_500
    rescue_from ActionController::RoutingError, :with => :render_404
    rescue_from ActionController::UnknownAction, :with => :render_404
    rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  end

  def render_500
    logger.error "#{$!.class.to_s}: #{$!}"
    logger.error $!.backtrace.join("\n")
    render_error(500)
  end

  def render_404
    render_error(404)
  end

protected

  def render_error(code)
    render :template => "shared/errors/#{code}", :status => :not_found
  end

end
