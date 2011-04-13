namespace :db do
  namespace :fixtures do
    desc "Load fixtures and then set dynamically generated attributes such as searchkey"
    task :process do
      Rake::Task["db:fixtures:load"].invoke # Load the fixtures
      Course.all.each &:save # Courses have attributes that are generated before_save
    end
  end
end
