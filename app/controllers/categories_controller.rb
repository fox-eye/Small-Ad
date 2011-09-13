class CategoriesController < ApplicationController
  respond_to :json,:html
  
  def show
  end

  def get_sub_cat
     id = params[:id]
     @children = Category.find(id).children      
     respond_with(@children)
  end

end
