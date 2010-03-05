# == Schema Information
# Schema version: 20100304080807
#
# Table name: favorites
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  game_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
end
