require 'active_record'
require 'populator'

namespace :dev do

  desc "build up current db and clean up old one"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]

  desc "fake game"
  task :populator_game => [:environment] do
    Game.populate(30) do |game|
      game.name = ["carcassonne", "catan"] #隨機選一個塞
      #game.intro = "#{rand(50)}" #隨機選個數字塞，上限50
      game.intro = Populator.words(5..10) #隨機塞入5～10個字
      #game.intro = Populator.sentences(2) #隨機塞入2個句子
      #game.intro = Populator.paragraphs(3) #隨機塞入3段文章
      game.designer = "Klaus-Jurgen Wrede"
      game.publisher = "RGG"
    end
    puts "fake games data"
  end

  desc "fake game"
  task :populator_post => [:environment] do
    Post.populate(30) do |post|
      post.subject = Populator.words(1)
      post.content = Populator.paragraphs(2)
    end
    puts "fake posts data"
  end    
end