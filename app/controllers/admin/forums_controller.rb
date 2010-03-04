class Admin::ForumsController < ApplicationController
  before_filter :login_required
  before_filter :require_is_admin
  
  def index
    @posts = Post.recent.paginate( :page => params[:page], :per_page => 5)
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments  
  end

  def destroy
    @post.destroy
    redirect_to forums_path
  end
  
  protected
  def find_post
    @post = current_user.posts.find(params[:id])    
  end
      
end
