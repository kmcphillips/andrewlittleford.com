module PaginationHelper

  def pagination_params(opts={})
    {:page => params[:page] || 1, :per_page => PAGINATION_PER_PAGE}.merge(opts)
  end

end
