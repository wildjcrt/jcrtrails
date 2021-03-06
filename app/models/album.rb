# == Schema Information
# Schema version: 20100305024843
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
#  created_at              :datetime
#  updated_at              :datetime
#

class Album < ActiveRecord::Base
  has_attached_file :attachment, :styles => { :medium => "300x300>", :thumb => "100x100>" }  
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :game, :class_name => "Game", :foreign_key => "game_id"
  has_many :photos
  named_scope :recent
end
