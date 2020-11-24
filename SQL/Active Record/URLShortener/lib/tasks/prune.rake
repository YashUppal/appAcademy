namespace :prune do
  desc "Prune stale urls from the database"
  task :prune,[:time] => :environment do |t,args|
    time = args[:time].to_i
    puts "Pruning visits..."
    ShortenedUrl.prune(time)
  end
end