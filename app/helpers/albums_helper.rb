module AlbumsHelper
  def render_list_show_cover(album)
    image_tag album.attachment.url(:thumb)
  end
end
