include PageViews::Controller
class PhotosController < ApplicationController

  before_filter :login_required, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :find_album
  before_filter :increment_page_views, :only => [:show]

  def index
    @photos = @album.photos.recent.paginate( :page => params[:page], :per_page => 10)
  end

  def show
    @photo = @album.photos.find(params[:id])
    @comments = @photo.comments
  end

  def increment_page_views
    @photo = @album.photos.find(params[:id])
    page_views_increment @photo
  end

  def new
    @photo = Photo.new
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def create
    @photo = current_user.photos.build(params[:photo])
    @photo.album_id = @album.id
    if @photo.save
      notice_stickie('Photo was successfully created.')
      redirect_to album_photos_path(@album)
    else
      render :action => "new"
    end
  end

  def update
    if @photo.update_attributes(params[:photo])
      notice_stickie('Photo was successfully updated.')
      redirect_to album_photos_path(@album, @photo)
    else
      format.html {render :action => "edit"}
    end
  end

  def destroy
    @photo.destroy
    warning_stickie('Photo was successfully remove.')
    redirect_to album_photos_path(@album)
  end

  protected
  def find_album
    @album = Album.find(params[:album_id])    
  end  
end
