require 'spec_helper'


describe SessionsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @attr = {:email => "", :password => ""}
      @user = User.new(@attr)  
    end
    
    describe "failure" do
      it "should render the same page (new)" do
        post :create, :session => @attr
        response.should render_template("new")
      end
      
      it "should display an error" do
        post :create, :session => @attr
        flash.now[:error].should =~ /Wrong user \/ email couple/i
      end
    end
    
    describe "success" do
      before(:each) do 
        @attr = {:email => "romano.lucas@gmail.com", :password => "test123"} 
        @user = Factory(:user)  
      end
      it "should sign in the user" do 
        post :create, :session => @attr
        controller.current_user.should == @user
        controller.should be_signed_in
      end
      
      it "should redirect to root_path" do
        post :create, :session => @attr
        response.should redirect_to(root_path)
      end
    end  
  
  end

  describe "GET 'destroy'" do
    it "should sign out the user" do
      post :destroy
      controller.current_user.should be_nil
      controller.should_not be_signed_in
    end
  end

end
