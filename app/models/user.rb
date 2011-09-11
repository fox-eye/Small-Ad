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

  before_save :encrypt_password
  class << self
    def authenticate(email, sent_password)
      user = find_by_email(email)
      (user && user.has_password?(sent_password))?user : nil
    end
  end

  def has_password?(sent_password)
    hash(sent_password) == password_hash
  end

  private

  def encrypt_password
    if password.present? && new_record?
      generate_salt!
    end
   self.password_hash = hash(password)
  end

  def hash(password)
    BCrypt::Engine.hash_secret(password,password_salt)
  end

  def generate_salt!
    self.password_salt = BCrypt::Engine.generate_salt
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

