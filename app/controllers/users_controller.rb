class UsersController < ApplicationController
  
  before_filter :get_categories
  
  # users signup
  def new
    @title = "Please sign up and join us !"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if(@user.save)
      sign_in(@user)
      redirect_to root_path,:flash => {:success => "You have successfully signed in !"}
    else
      render 'new'
    end

  end

end
