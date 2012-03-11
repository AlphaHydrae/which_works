require 'helper'

describe 'Default Options' do

  before :each do
    WhichSpecHelper.stub_unix!
    Which.class_variable_set(:@@options, {})
  end

  it "should have no options by default" do
    Which.options.should == {}
  end

  it "should allow to set the :all option to true by default" do
    Which.options = { :all => true }
    Which.which('svn').should == [ '/opt/local/bin/svn', '/usr/bin/svn' ]
  end

  it "should allow to set the :array option to true by default" do
    Which.options = { :array => true }
    Which.which('ls').should == [ '/bin/ls' ]
  end

  it "should allow to clear default options" do
    Which.class_variable_set(:@@options, { :all => true, :array => true })
    Which.options = {}
    Which.options.should == {}
    Which.which('ls').should == '/bin/ls'
  end

  it "should return the default options" do
    Which.options = { :all => true, :array => false }
    Which.options.should == { :all => true, :array => false }
  end

  it "should copy the given options" do
    options = { :all => true, :array => true }
    Which.options = options
    Which.options.should == options
    Which.options.should_not === options
  end
end
