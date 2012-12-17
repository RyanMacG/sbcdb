require 'spec_helper'

describe "StaticPages" do

  describe "Home Page" do
    it "should have the content 'Subcontractor'" do
      visit '/static_pages/home'
      page.should have_content('Subcontractor')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      page.should have_selector('title', text: 'SbcDB | Home')
    end
  end

  describe "Help page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('help')
    end

    it "should have the title 'Help" do
      visit '/static_pages/help'
      page.should have_selector('title', text: 'SbcDB | Help')
    end
  end
end