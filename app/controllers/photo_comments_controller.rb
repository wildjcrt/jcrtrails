class PhotoCommentsController < ApplicationController
  before_filter :find_photo

  def new
    @comment = @photo.comments.build
  end
  
  def create
    @comment = @photo.comments.build(params[:comment])
    @comment.user_id = current_user.id
    if @comment.save
      notice_stickie('Photo was successfully created.')
      redirect_to photo_path(@photo)
    else
      render :action => "new"
    end
  end
 
  protected
  def find_photo
    @photo = Photo.find(params[:photo_id])  
  end
end
