# == Schema Information
# Schema version: 20100303055944
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  content    :text
#  post_id    :integer(4)
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  album_id   :integer(4)
#

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post, :counter_cache => true
end
