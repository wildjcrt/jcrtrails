# == Schema Information
# Schema version: 20100303055944
#
# Table name: album_comments
#
#  id         :integer(4)      not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class AlbumComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :album, :counter_cache => true
end
