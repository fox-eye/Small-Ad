class PagesController < ApplicationController
  def index
    @title = "search for small ads with tiny efforts"
    
    # afficher les 10 dernières petites annonces
    @last_ads = Ad.limit(8).order("created_at DESC")
    
    get_categories
  end

  def about
    @title = "About us"
  end

  def terms
    @title = "Terms"
  end

end
