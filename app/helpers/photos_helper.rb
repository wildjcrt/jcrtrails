module PhotosHelper
  def render_list_show_photo(photo)
    image_tag photo.attachment.url(:thumb)
  end
end
