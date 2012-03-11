
# The {Which} module can locate program files in the user's path.
# See {Which.which}.
module Which

  # Locates a program file in the user's path.
  #
  # The which method takes a list of command names and searches the path
  # for each executable file that would be run had these commands actually
  # been invoked.
  #
  # By default, which will return nil if no executable was found, one
  # string if one executable file was found, or an array if several were
  # found. You can customize this behavior by passing the <tt>:array</tt>
  # option.
  #
  # == Options
  # * <tt>:all => boolean</tt> - List all instances of executables found
  #   (instead of just the first one of each). False by default.
  # * <tt>:array => boolean</tt> - Always return an array. False by default.
  #
  # == Examples
  #   Which.which('ls')                  #=> "/bin/ls"
  #   Which.which('unknown')             #=> nil
  #   Which.which('ls', 'screen')        #=> [ "/bin/ls", "/usr/bin/screen" ]
  #   Which.which('svn', :all => true)   #=> [ "/opt/local/bin/svn", "/usr/bin/svn" ]
  #   Which.which('ls', :array => true)  #=> [ "/bin/ls" ]
  #   Which.which('/usr/bin/screen')     #=> "/usr/bin/screen"
  def self.which *programs
    
    found = []
    options = programs.last.kind_of?(Hash) ? programs.pop : {}
    options = @@options.merge options

    programs.each do |program|

      program_found = false

      # valid file extensions (cross-platform)
      extensions = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : [ '' ]

      ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|

        extensions.each do |ext|

          # using expand_path makes it work with absolute program paths
          absolute_path = File.expand_path "#{program}#{ext}", path

          if File.executable? absolute_path
            program_found = true
            found << absolute_path
            break unless options[:all]
          end
        end

        break if program_found && !options[:all]
      end
    end

    found.uniq! # FIXME: do not add to array if already included
    if found.length <= 1
      options[:array] ? found : found.first
    else
      found
    end
  end

  def self.options
    @@options
  end

  def self.options= options
    raise ArgumentError, "Default options must be a hash, #{options.class.name} given." unless options.kind_of?(Hash)
    @@options = options.dup
  end

  private

  @@options = Hash.new
end
