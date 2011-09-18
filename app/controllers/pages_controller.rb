class PagesController < ApplicationController
  before_filter :get_categories
  
  def index
    @title = "search for small ads with tiny efforts"
    
    # afficher les 10 dernières petites annonces
    @last_ads = Ad.limit(8).order("created_at DESC")
   
  end

  def about
    @title = "About us"
  end

  def terms
    @title = "Terms"
  end

end
