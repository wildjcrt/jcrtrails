class AddPageViewsToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :page_views_counter, :integer, :default => 0
    add_index :photos, :page_views_counter
  end

  def self.down
    remove_index :photos, :page_views_counter
    remove_column :photos, :page_views_counter
  end
end
