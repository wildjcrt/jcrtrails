class PhotosController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :create, :update, :destroy]
  before_filter :find_photo, :only =>  [:edit, :update, :destroy]

  def index
    @photos = Photo.recent.paginate( :page => params[:page], :per_page => 5)
  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = current_user.photos.build(params[:photo])
    if @photo.save
      notice_stickie('Photo was successfully created.')
      redirect_to photo_path(@photo)
    else
      render :action => "new"
    end
  end

  def update
    if @photo.update_attributes(params[:photo])
      notice_stickie('Photo was successfully updated.')
      redirect_to photo_path(@photo)
    else
      format.html {render :action => "edit"}
    end
  end

  def destroy
    @photo.destroy
    warning_stickie('Photo was successfully remove.')
    redirect_to photos_path
  end

  protected
  def find_photo
    @photo = current_user.photos.find(params[:id])    
  end  
end
