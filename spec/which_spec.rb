require 'helper'

describe Which do
  COMMANDS = %w( /bin/ls /usr/bin/screen /home/johndoe/bin/custom )

  before :each do

    ENV.stub!(:[]) do |name|
      case name
      when 'PATH'
        "/bin#{File::PATH_SEPARATOR}/usr/bin"
      when 'PATHEXT'
        nil
      end
    end

    File.stub!(:executable?) do |name|
      COMMANDS.include? name.to_s
    end
  end

  it "should find commands" do
    Which.which('ls').should == '/bin/ls'
  end

  it "should find commands with absolute paths" do
    Which.which('/bin/ls').should == '/bin/ls'
  end

  it "should not find commands that do not exist" do
    [ 'wrong', 'cp', '/usr/bin/du' ].each do |unknown|
      Which.which(unknown).should be_nil
    end
  end
end
