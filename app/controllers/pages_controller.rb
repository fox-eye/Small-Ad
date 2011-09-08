class PagesController < ApplicationController
  def index
    @title = "Welcome, go search for small ads!"
  end

  def about
    @title = "About us"
  end

  def terms
    @title = "Terms"
  end

end
