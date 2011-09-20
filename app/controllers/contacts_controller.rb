class ContactsController < ApplicationController
   before_filter :get_categories
   
  def create
     @ad = Ad.find(params[:ad_id])
     @contact = Contact.new(params[:contact])
     if @contact.valid?
      #send email
      user = Ad.find(params[:ad_id]).user
      ContactMailer.send_to_seller(user,params[:contact],@ad).deliver
      redirect_to(@ad, :flash => {:success => "The seller is now aware of your interest !"})
     else
       render 'ads/show'
     end
     
  end

end
