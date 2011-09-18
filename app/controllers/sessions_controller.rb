class SessionsController < ApplicationController
  before_filter :get_categories, :except => :destroy
  
  def new
    
  end

  def create

    user = User.authenticate(params[:session][:email], params[:session][:password])

    if user.nil?
      flash.now[:error] = "Wrong user / email couple. Please try again"
      render 'new'
    else
      session[:user_id] = user.id
      redirect_to(root_path, :flash => {:success => "Your are successfully signed in !"})
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to(signin_path)
  end

end
