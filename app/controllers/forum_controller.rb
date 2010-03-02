class ForumController < ApplicationController
  def index
    @posts = Post.find(:all)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def create
    @post = Post.new(params[:post])
    @post = Post.create(params[:post])
    if @post.save
      flash[:notice] = 'Post was successfully created.'
      redirect_to forum_path(@post)
    else
      render :action => "new"
    end
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = 'Post was successfully updated.'
      redirect_to forum_path(@post)
    else
      format.html {render :action => "edit"}
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to forums_path
  end
end
