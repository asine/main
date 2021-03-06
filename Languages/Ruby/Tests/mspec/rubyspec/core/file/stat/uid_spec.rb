require File.dirname(__FILE__) + '/../../../spec_helper'

describe "File::Stat#uid" do
  before :each do
    @file = tmp('i_exist')
    touch(@file) { |f| f.write "rubinius" }
  end

  after :each do
    rm_r @file
  end
  
  it "should be able to determine the owner through a File::Stat object" do
    st = File.stat(@file)
    st.uid.is_a?(Integer).should == true
    st.uid.should == Process.uid
  end
end
