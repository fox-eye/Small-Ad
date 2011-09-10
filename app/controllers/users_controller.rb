class UsersController < ApplicationController
  # users signup
  def new
    @title = "Please sign up and join us !"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if(@user.save)
      redirect_to root_path,:flash => {:success => "You have successfully signed in !"}
    else
      render 'new'
    end

  end

end
