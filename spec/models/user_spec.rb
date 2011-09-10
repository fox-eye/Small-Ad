require 'spec_helper'

describe User do
  before(:each) do
    @user = User.new
    @attr = {
              :firstname => "Lucas",
              :lastname => "Romano",
              :email => "romano.lucas@gmail.com",
              :password => "pass123",
              :city => "Etterbeek"
            }
  end
  
  describe "validation" do
    it "should ensure presence of a first name" do
      new_user_no_firstname = User.new(@attr.merge(:firstname => ""))
      new_user_no_firstname.should_not be_valid  
    end
    
    it "should ensure presence of a last name" do
      new_user_no_lastname = User.new(@attr.merge(:lastname => ""))
      new_user_no_lastname.should_not be_valid  
    end
    
    it "should ensure presence of a a city" do
      new_user_no_city = User.new(@attr.merge(:city => ""))
      new_user_no_city.should_not be_valid  
    end
    
    it "should ensure presence of email" do
       new_user_no_email = User.new(@attr.merge(:email => ""))
       new_user_no_email.should_not be_valid  
    end
    
    it "should ensure that email is ok(syntax ok)" do
      new_user_not_an_email = User.new(@attr.merge(:email => "luc@plou"))
      new_user_not_an_email.should_not be_valid
    end
    
    it "should ensure that email is unique in database" do
      in_db_user = User.create(@attr)
      new_user = User.new(@attr.merge(:email => "romano.lucas@gmail.com"))
      new_user.should_not be_valid
    end
    
     it "should ensure presence of a password and a confirmation" do
       new_user_no_password = User.new(@attr.merge(:password => "",:password_confirmation => ""))
       new_user_no_password.should_not be_valid  
    end
    
    it "should ensure that password and password confirmation are equal" do
       new_user_no_password = User.new(@attr.merge(:password => "foo",:password_confirmation => "foot"))
       new_user_no_password.should_not be_valid  
    end      
    
    it "should ensure that password is not too long" do
      long_password = "bla" * 50
      new_user_long_password = User.new(@attr.merge(:password => long_password,:password_confirmation => long_password))
      new_user_long_password.should_not be_valid 
    end
    
    it "should ensure that password is not too short" do
      short_password = "aaa"
      new_user_short_password = User.new(@attr.merge(:password => short_password,:password_confirmation => short_password))
      new_user_short_password.should_not be_valid 
    end

  end
  
  describe "passwords" do
    
    before(:each) do
      @user = User.new(@attr)
    end
   
    it "should have a password attribute" do
      @user.should respond_to :password
    end
    
     it "should have a password confirmation attribute" do
      @user.should respond_to :password_confirmation
    end
  end
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

