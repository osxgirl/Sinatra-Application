ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :migrations do
    system("rake db:migrate && rake db:migrate SINATRA_ENV=test")
end

# Type `rake -T` on your command line to see the available rake tasks.
