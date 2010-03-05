class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
    	t.string  :name
      t.text    :intro
      t.string  :designer
      t.string  :publisher
      t.integer :forum_id
      t.integer :album_id
      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
