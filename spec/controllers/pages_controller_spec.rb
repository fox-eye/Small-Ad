require 'spec_helper'

describe PagesController do
   render_views
   
   before(:each) do
    @base_title = "Small ad";
  end
  
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "should have content in the body tag" do
       get "index"
      response.body.should_not =~ /<body>\s*<\/body>/ 
    end
    
    it "should have the right title" do
      get "index"
      response.should have_selector("title",:content => "#{@base_title} | search for small ads with tiny effort")
    end
    
    it "should have a search form" do
      get "index"
      response.should have_selector("#global-search")
    end
    
    it "should have a signup button" do
      get "index"
      response.should have_selector("#signup_btn a",:href => signup_path, :content => "Go sign up !")
    end
    
  end

  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
      response.should be_success
    end
    
    it "should have the right title" do
      get "about"
      response.should have_selector("title",:content => "#{@base_title} | About us")
    end
  end

  describe "GET 'terms'" do
    it "should be successful" do
      get 'terms'
      response.should be_success
    end
    
    it "should have the right title" do
      get "terms"
      response.should have_selector("title",:content => "#{@base_title} | Terms")
    end
  end

end
