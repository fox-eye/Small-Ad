class PagesController < ApplicationController
  def index
    @title = "search for small ads with tiny efforts"
  end

  def about
    @title = "About us"
  end

  def terms
    @title = "Terms"
  end

end
