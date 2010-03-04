class ForumController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :create, :update]
                                #:except => [:index, :show]
  before_filter :find_post, :only =>  [:edit, :update]
                            
  def index
#    @posts = Post.recent.hot.paginate( :page => params[:page], :per_page => 5)
    @posts = Post.recent.paginate( :page => params[:page], :per_page => 5)
  end
  
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
  end
  
  def new
    @post = Post.new
  end
  
  def edit
  end
  
  def create
    @post = current_user.posts.build(params[:post])
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to forum_path(@post)
    else
      render :action => "new"
    end
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to forum_path(@post)
    else
      format.html {render :action => "edit"}
    end
  end
  
  protected
  def find_post
    @post = current_user.posts.find(params[:id])    
  end
end
