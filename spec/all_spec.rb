require 'helper'

describe ':all option' do

  before :each do
    WhichSpecHelper.stub_unix!
  end

  it "should find all executable files" do
    Which.which('svn', :all => true).should == [ '/opt/local/bin/svn', '/usr/bin/svn' ]
  end

  it "should find all executable files and other files" do
    Which.which('ls', 'svn', 'screen', :all => true).should == [ '/bin/ls', '/opt/local/bin/svn', '/usr/bin/svn', '/usr/bin/screen' ]
  end

  it "should not find anything when given no command to find" do
    Which.which({ :all => true }).should be_nil
  end

  it "should only find one executable file when given an absolute path" do
    Which.which('/opt/local/bin/svn', :all => true).should == '/opt/local/bin/svn'
  end
end
