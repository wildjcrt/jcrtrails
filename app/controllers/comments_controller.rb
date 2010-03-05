class CommentsController < ApplicationController
  before_filter :find_post

  def new
    @comment = @post.comments.build
  end
  
  def create
    @comment = @post.comments.build(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      notice_stickie('Post was successfully created.')
      redirect_to forum_path(@post)
    else
      render :action => "new"
    end
  end
 
  protected
  def find_post
    @post = Post.find(params[:forum_id])  
  end  
end
