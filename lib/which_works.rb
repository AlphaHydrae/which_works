
module Which

  def self.which *programs
    
    found = []
    options = programs.last.kind_of?(Hash) ? programs.pop : {}

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

    if found.length <= 1
      options[:array] ? found : found.first
    else
      found
    end
  end
end
