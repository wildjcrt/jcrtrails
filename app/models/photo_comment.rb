# == Schema Information
# Schema version: 20100305024843
#
# Table name: photo_comments
#
#  id         :integer(4)      not null, primary key
#  content    :text
#  user_id    :integer(4)
#  photo_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class PhotoComment < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo, :counter_cache => true
end
