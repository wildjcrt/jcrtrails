class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
    	t.string    :subject
      t.string    :content
    	t.string    :attachment_file_name
      t.string    :attachment_content_type
      t.integer   :attachment_file_size
      t.datetime  :attachment_updated_at
      t.integer   :user_id
      t.integer   :album_id
      t.integer   :photo_comments_count, :default => 0
      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
