
class Which

  def self.which cmd

    # valid file extensions (cross-platform)
    extensions = ENV['PATHEXT'] ? ENV['PATHEXT'].split(';') : [ '' ]

    ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|

      extensions.each do |ext|

        absolute_path = File.expand_path "#{cmd}#{ext}", path
        return absolute_path if File.executable? absolute_path
      end
    end

    return nil
  end
end
