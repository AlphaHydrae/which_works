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
  gem.homepage = "http://github.com/AlphaHydrae/which_works"
  gem.license = "MIT"
  gem.summary = %Q{Ruby UNIX-like which.}
  gem.description = %Q{Locates a program file in the user's path. The which method takes a list of command names and searches the path for each executable file that would be run had these commands actually been invoked.}
  gem.email = "hydrae.alpha@gmail.com"
  gem.authors = ["AlphaHydrae"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core/rake_task'
desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  #t.pattern = "./spec/**/*_spec.rb" # don't need this, it's default.
  # Put spec opts in a file named .rspec in root
end

[ 'version', 'version:bump:major', 'version:bump:minor', 'version:bump:patch', 'version:write' ].each do |task|
  Rake::Task[task].clear
end

# version tasks
require 'rake-version'
RakeVersion::Tasks.new do |v|
  v.copy 'lib/which_works.rb'
end

task :default => :spec

desc "Generate documentation"
task :doc => ['doc:generate']
namespace :doc do
  project_root = File.dirname __FILE__
  doc_destination = File.join project_root, 'doc'

  begin
    require 'yard'
    require 'yard/rake/yardoc_task'

    YARD::Rake::YardocTask.new(:generate) do |yt|
      yt.files   = Dir.glob(File.join(project_root, 'lib', '**', '*.rb')) + 
                   [ File.join(project_root, 'README.md') ]
      yt.options = ['--output-dir', doc_destination, '--readme', 'README.md', '--private', '--protected']
    end
  rescue LoadError
    desc "Generate YARD Documentation"
    task :generate do
      abort "Please install the YARD gem to generate rdoc."
    end
  end
end
