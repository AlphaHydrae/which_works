# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "which_works"
  gem.homepage = "https://github.com/AlphaHydrae/which_works"
  gem.license = "MIT"
  gem.summary = %Q{Ruby UNIX-like which.}
  gem.description = %Q{Locates a program file in the user's path. The which method takes a list of command names and searches the path for each executable file that would be run had these commands actually been invoked.}
  gem.email = "hydrae.alpha@gmail.com"
  gem.authors = ["AlphaHydrae"]
  gem.files = %x[git ls-files -- lib].split("\n") + %w(Gemfile LICENSE.txt README.md VERSION)
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  #t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

require 'rake-version'
RakeVersion::Tasks.new do |v|
  v.copy 'lib/which_works.rb'
end

task :default => :spec
