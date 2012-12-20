require 'spec_helper'

describe ApplicationHelper do
  describe "full_title" do
    it "should include the page title" do
      full_title("foo").should =~ /foo/
    end

    it "should include the base_title" do
      full_title("foo").should =~ /^SbcDB/
    end
  end
end