class AdsController < ApplicationController
  
  before_filter :load_ad_cat_datas, :only => [:create,:new]
  
  #show current user small ads
  def index
    @ads = current_user.ads
  end
  
  # current user creates a new small ad
  def new
    @ad = Ad.new
  end
  
  def show
  end
  
  # create a new ad for current user
  def create
    @ad = current_user.ads.build(params[:ad])
    @ad.category_id = params[:ad_sub_cats][:name]
    if@ad.save
      redirect_to my_ads_path, :flash => {:success => "Your new ad has been successfully created !"}
    else
      render 'new'
    end 
    
  end

  def destroy
    Ad.find(params[:id]).destroy
    redirect_to my_ads_path, :flash => {:success => "This ad has been destroyed !"}
  end

  def search
  end

  def edit
  end

  def update
  end
  
  private 
    def load_ad_cat_datas
      # load main categories
      @ad_root_cats = Category.roots.order(:name)           
      @root_cat_options = @ad_root_cats.map{|root| [root.name,root.id]}
    
      # load subcategories
      @sub_cat_options = Category.children_of(@ad_root_cats.first).map{|sub_cat|[sub_cat.name,sub_cat.id]}
    end
end
