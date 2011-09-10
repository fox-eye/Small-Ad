require 'spec_helper'
describe UsersController do
  
  render_views 
 
  describe "GET 'new" do
    it "should be successfull" do
      get 'new'
      response.should be_success
    end
    
    it "should have a signin form" do
      get "new"
      response.should have_selector("form#new_user")
    end
  end
  
  describe "POST 'create" do
    before(:each) do
         @attr = {
              :firstname => "",
              :lastname => "",
              :email => "",
              :password => "",
              :password_confirmation => "",
              :city => ""
            }
    end
    
    describe "failure" do
      it "should render the users/new template" do
        post :create, :user => @attr
        response.should render_template("new")
      end
      
      it "should not create a new user" do
        lambda do
          post :create, :user => @attr
          response.should render_template("new")
        end.should_not change(User,:count)
      end
    end
    
    describe "success" do
      before(:each) do
         @attr = {
              :firstname => "Lucas",
              :lastname => "Romano",
              :email => "romano.lucas@gmail.com",
              :password => "test123",
              :password_confirmation => "test123",
              :city => "Namur"
            }
      end
      
      it "should redirect_to root page" do
        post :create, :user => @attr
        response.should redirect_to(root_path)
      end
      
      it "should modify users count" do
        lambda do 
          post :create, :user => @attr
        end.should change(User,:count).by(1)
      end
      
      it "should display a success flash message" do
        post :create, :user => @attr
        flash[:success].should =~ /you have successfully signed in !/i
      end
      
    end
    
  end
end
