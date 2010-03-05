class AlbumCommentsController < ApplicationController
  before_filter :find_album

  def new
    @comment = @album.comments.build
  end
  
  def create
    @comment = @album.comments.build(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      notice_stickie('Album was successfully created.')
      redirect_to album_path(@album)
    else
      render :action => "new"
    end
  end
 
  protected
  def find_album
    @album = Album.find(params[:album_id])  
  end
end
