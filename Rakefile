ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc "Start app console in terminal"
task :c do 
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    ARGV.clear 
    cols = Rake.application.terminal_width
    system "clear"
    puts "*" * cols 
    puts " Rake Console ".center(cols, "*")
    puts "*" * cols 
    Pry.start 
end
