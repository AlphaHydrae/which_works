require 'helper'

describe Which do

  before :each do
    WhichSpecHelper.stub_unix!
  end

  it "should find a single command" do
    Which.which('ls').should == '/bin/ls'
  end

  it "should find a single command with an absolute path" do
    Which.which('/bin/ls').should == '/bin/ls'
  end

  it "should not find commands that do not exist" do
    [ 'foo', 'bar', 'wrong', 'cp', '/usr/bin/du' ].each do |unknown|
      Which.which(unknown).should be_nil
    end
  end

  it "should find nothing when given nothing" do
    Which.which.should be_nil
  end

  it "should find several commands" do
    Which.which('ls', 'screen').should == [ '/bin/ls', '/usr/bin/screen' ]
  end

  it "should find only existing commands" do
    Which.which('ls', 'cp', 'screen', '/bin/foo').should == [ '/bin/ls', '/usr/bin/screen' ]
  end

  it "should not find a command that is not in the path" do
    Which.which('custom').should be_nil
  end

  it "should find the first executable file in the path" do
    Which.which('svn').should == '/opt/local/bin/svn'
  end
end
