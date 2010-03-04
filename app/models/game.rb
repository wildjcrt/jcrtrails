# == Schema Information
# Schema version: 20100304063718
#
# Table name: games
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  intro      :string(255)
#  designer   :string(255)
#  publisher  :string(255)
#  forum_id   :integer(4)
#  album_id   :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Game < ActiveRecord::Base
  has_many  :favorits
  has_many  :users, :through => :favorites
  has_one   :album
  named_scope :recent  
end
