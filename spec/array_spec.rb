require 'helper'

describe ':array option' do

  before :each do
    WhichSpecHelper.stub_unix!
  end

  it "should return an array when given nothing to find" do
    Which.which({ :array => true }).should == []
  end

  it "should return an array if the given command does not exist" do
    Which.which('unknown', :array => true).should == []
  end

  it "should return an array when finding a single command" do
    Which.which('ls', :array => true).should == [ '/bin/ls' ]
  end

  it "should return an array when finding several commands" do
    Which.which('ls', 'svn', :array => true).should == [ '/bin/ls', '/opt/local/bin/svn' ]
  end
end
