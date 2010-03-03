
namespace :dev do

  desc "build up current db and clean up old one"
  task :build => ["tmp:clear", "log:clear", "db:drop", "db:create", "db:migrate", "db:seed"]

end