class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :firstname,:lastname, :email, :password, :password_confirmation, :city
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :firstname, :presence => true 
  validates :lastname, :presence => true
  validates :city, :presence => true
  validates :password, :presence => true, 
                       :confirmation => true,
                       :length => { :in => 6..20 }
  validates :email, 
                  :presence => true, 
                  :format => {:with => email_regex},
                  :uniqueness => {:case_sensitive => false}      
end

# == Schema Information
#
# Table name: users
#
#  id            :integer         not null, primary key
#  firstname     :string(255)
#  lastname      :string(255)
#  email         :string(255)
#  city          :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

