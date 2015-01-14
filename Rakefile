require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)
task :test => :spec

task :default => [:spec]

require "bundler/gem_tasks"

task :console do
  require 'pry'
  require 'rmeetup'

  def reload!
    # Change 'gem_name' here too:
    files = $LOADED_FEATURES.select { |feat| feat =~ /\/rmeetup\// }
    files.each { |file| load file }
  end

  ARGV.clear
  Pry.start
end
