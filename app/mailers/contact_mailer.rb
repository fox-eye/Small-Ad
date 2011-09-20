class ContactMailer < ActionMailer::Base
  #default :from => "from@example.com"
  
  def send_to_seller(seller,from,ad)
    @seller = seller
    @from_firstname = from[:firstname]
    @from_lastname = from[:lastname]
    @from_comment = from[:comment]
    @ad_title = ad.title
    @ad_id = ad.id
    
    mail(
          :to => seller.email, 
          :from => "#{from[:firstname]+' '+from[:lastname]}<#{from[:email]}>",
          :subject => "Small ad : someone is interested by your ad '#{ad.title}'"
         )
  end
end
