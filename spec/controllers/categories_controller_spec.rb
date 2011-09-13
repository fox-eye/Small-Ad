require 'spec_helper'

describe CategoriesController do

  describe "GET 'show'" do
    it "should be successful" do
      get 'show'
      response.should be_success
    end
  end

  describe "GET 'get_sub_cat'" do
    it "should be successful" do
      get 'get_sub_cat'
      response.should be_success
    end
  end

end
