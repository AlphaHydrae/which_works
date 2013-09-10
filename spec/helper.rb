require 'rubygems'
require 'bundler'
require 'simplecov'

# test coverage
SimpleCov.start

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

require 'rspec'
require 'which_works'

module WhichSpecHelper
  UNIX_COMMANDS = %w( /bin/ls /usr/bin/screen /home/johndoe/bin/custom /opt/local/bin/svn /usr/bin/svn )
  UNIX_PATH = "/bin:/opt/local/bin:/usr/bin"

  def self.stub_unix!
    
    v = $VERBOSE
    $VERBOSE = nil
    File.const_set :SEPARATOR, '/'
    File.const_set :PATH_SEPARATOR, ':'
    $VERBOSE = v

    UNIX_COMMANDS.each{ |com| com.gsub!(/\//, File::SEPARATOR) }
    UNIX_PATH.gsub!(/\:/, File::PATH_SEPARATOR).gsub!(/\//, File::SEPARATOR)

    ENV.stub(:[]) do |name|
      case name
      when 'PATH'
        UNIX_PATH
      when 'PATHEXT'
        nil
      end
    end

    File.stub(:executable?) do |name|
      UNIX_COMMANDS.include? name.to_s
    end
  end
end

