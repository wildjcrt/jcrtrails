class Post < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :user
  has_many :comments
  named_scope :recent
#  named_scope :recent, :conditions => ["id > ?", 6], :order => "id ASC"  
#  named_scope :recent, lambda { |amount| { :limit => (amount || 10) , :order => "updated_at DESC" } }  
#  named_scope :hot, :conditions => ["comments_count > ?", 2]
end
