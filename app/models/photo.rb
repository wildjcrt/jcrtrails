# == Schema Information
# Schema version: 20100513093937
#
# Table name: photos
#
#  id                      :integer(4)      not null, primary key
#  subject                 :string(255)
#  content                 :string(255)
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer(4)
#  attachment_updated_at   :datetime
#  user_id                 :integer(4)
#  album_id                :integer(4)
#  photo_comments_count    :integer(4)      default(0)
#  created_at              :datetime
#  updated_at              :datetime
#  page_views_counter      :integer(4)      default(0)
#

class Photo < ActiveRecord::Base
  with_page_views

  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }  
  acts_as_taggable
  belongs_to :album, :class_name => "Album", :foreign_key => "album_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  has_many :comments, :class_name => "PhotoComment" 
  named_scope :recent   
end
