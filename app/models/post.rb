# == Schema Information
# Schema version: 20100303055944
#
# Table name: posts
#
#  id                      :integer(4)      not null, primary key
#  subject                 :string(255)
#  content                 :string(255)
#  created_at              :datetime
#  updated_at              :datetime
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer(4)
#  attachment_updated_at   :datetime
#  user_id                 :integer(4)
#  comments_count          :integer(4)      default(0)
#

class Post < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :user
  has_many :comments
  named_scope :recent
#  named_scope :recent, :conditions => ["id > ?", 6], :order => "id ASC"  
#  named_scope :recent, lambda { |amount| { :limit => (amount || 10) , :order => "updated_at DESC" } }  
#  named_scope :hot, :conditions => ["comments_count > ?", 2]
end
