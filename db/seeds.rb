# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

user = User.new(:login => "jcrt", :password => "123456", :password_confirmation => "123456", :email => "jcrt@pixnet.tw")
user.is_admin = true
user.save!

user = User.new(:login => "xdite", :password => "123456", :password_confirmation => "123456", :email => "xdite@pixnet.tw")
user.save!

game = Game.new(:name => "CATAN", :intro => "Building game.", :designer => "Klaus Teuber", :publisher => "Mayfair Games")
game.save!