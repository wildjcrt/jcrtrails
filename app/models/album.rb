# == Schema Information
# Schema version: 20100303055944
#
# Table name: albums
#
#  id                      :integer(4)      not null, primary key
#  subject                 :string(255)
#  content                 :string(255)
#  attachment_file_name    :string(255)
#  attachment_content_type :string(255)
#  attachment_file_size    :integer(4)
#  attachment_updated_at   :datetime
#  user_id                 :integer(4)
#  album_comments_count    :integer(4)      default(0)
#  created_at              :datetime
#  updated_at              :datetime
#

class Album < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  belongs_to :user
  has_many :comments, :class_name => "AlbumComment"
  named_scope :recent
end
