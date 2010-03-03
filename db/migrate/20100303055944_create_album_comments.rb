class CreateAlbumComments < ActiveRecord::Migration
  def self.up
    create_table :album_comments do |t|
      t.text      :content
      t.integer   :user_id
      t.integer   :album_id
      t.timestamps
    end
  end

  def self.down
    drop_table :album_comments
  end
end
