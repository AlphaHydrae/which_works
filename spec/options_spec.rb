require 'helper'

describe 'Default Options' do

  before :each do
    WhichSpecHelper.stub_unix!
    Which.options.clear
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

  it "should allow to set all options to true by default" do
    Which.options = { :all => true, :array => true }
    Which.which('ls').should == [ '/bin/ls' ]
    Which.which('svn').should == [ '/opt/local/bin/svn', '/usr/bin/svn' ]
  end

  it "should allow to clear default options" do
    Which.options = { :all => true, :array => true }
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
    Which.options.should_not equal(options)
  end

  it "should return its internal default options hash" do
    Which.options[:array] = true
    Which.options[:all] = 42
    Which.options[:array].should be_true
    Which.options[:all].should == 42
  end

  it "should allow to override the :all option" do
    Which.options = { :all => true, :array => true }
    Which.which('svn', :all => false).should == [ '/opt/local/bin/svn' ]
  end

  it "should allow to override the :array option" do
    Which.options = { :all => true, :array => true }
    Which.which('ls', :array => false).should == '/bin/ls'
  end

  it "should allow to override all options" do
    Which.options = { :all => true, :array => true }
    Which.which('ls', :all => false, :array => false).should == '/bin/ls'
    Which.which('svn', :all => false, :array => false).should == '/opt/local/bin/svn'
  end

  it "should only accept a hash as default options" do
    [ nil, false, true, String.new, Array.new, 2, 4.5 ].each do |invalid|
      lambda{ Which.options = invalid }.should raise_error(ArgumentError)
    end
  end
end
