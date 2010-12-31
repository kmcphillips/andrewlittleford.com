class PostsController < ApplicationController

  def index
    @posts = Post.paginate(pagination_params(:order => "created_at DESC"))
    @title = "News"
  end

  def show
    @post = Post.find_by_permalink!(params[:id])
    @title = @post.title
  end

  def rss
    @items = (Post.order("created_at DESC") + Event.order("starts_at DESC")).sort{|x,y| x.sort_by <=> y.sort_by}
    
    respond_to do |wants|
      wants.xml do
        render :layout => false
      end
    end
  end
end
