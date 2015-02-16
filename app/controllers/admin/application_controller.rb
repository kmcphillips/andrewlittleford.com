class Admin::ApplicationController < ApplicationController
  before_filter :require_login, :check_read_only

  def read_only?
    !!Rails.application.secrets[:read_only]
  end

  def check_read_only
    if read_only?
      clear_current_user
      flash[:error] = "Sorry, but you cannot log in right now. Site temporarily in read-only mode."
      redirect_to root_path
    end

    true
  end
end
