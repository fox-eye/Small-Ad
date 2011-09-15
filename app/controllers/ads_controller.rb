class AdsController < ApplicationController
  
  before_filter :load_ad_cat_datas, :only => [:create,:new, :edit]
  before_filter :authenticate, :except => [:show, :search]
  
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
    @selected_root_category = params[:root_category]
    @selected_sub_category = params[:ad][:category_id]
    get_sub_categories(@selected_root_category)
       
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
  
  # edit the small ad
  def edit
    @ad = Ad.find(params[:id])
    @selected_root_category = @ad.category.parent_id
    @selected_sub_category = @ad.category_id
    get_sub_categories(@selected_root_category)
  end
  
  def update
    @ad = Ad.find(params[:id])
    if @ad.update_attributes(params[:ad])
      redirect_to my_ads_path, :flash => {:success => "Your new ad has been successfully modified !"}
    else
      render 'new'
    end 
  end
  
  private 
    # preload all common data neeeded for create / new / edit actions
    def load_ad_cat_datas
      # load main categories
      @ad_root_cats = Category.roots.order(:name)        
      @root_cat_options = @ad_root_cats.map{|root| [root.name,root.id]}
    
      # load subcategories
      get_sub_categories(@ad_root_cats.first)
    end
    
    def get_sub_categories(from)
      @sub_cat_options = Category.find(from).children.map{|sub_cat|[sub_cat.name,sub_cat.id]}
    end
    
    def authenticate
      redirect_to(signin_path) unless current_user
    end
    
end
