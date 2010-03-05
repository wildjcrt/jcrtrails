class AlbumsController < ApplicationController
    before_filter :login_required, :only => [:new, :edit, :create, :update, :destroy]
    before_filter :find_album, :only =>  [:edit, :update, :destroy]

    def index
      @albums = Album.recent.paginate( :page => params[:page], :per_page => 5)

    end

    def show
      @album = Album.find(params[:id])
   end

    def new
      @album = Album.new
    end

    def edit
    end

    def create
      @album = current_user.albums.build(params[:album])
      if @album.save
        notice_stickie('Album was successfully created.')
        redirect_to album_path(@album)
      else
        render :action => "new"
      end
    end

    def update
      if @album.update_attributes(params[:album])
        notice_stickie('Album was successfully updated.')
        redirect_to album_path(@album)
      else
        format.html {render :action => "edit"}
      end
    end

    def destroy
      @album.destroy
      warning_stickie('Album was successfully remove.')
      redirect_to albums_path
    end

    protected
    def find_album
      @album = current_user.albums.find(params[:id])    
    end  
end
