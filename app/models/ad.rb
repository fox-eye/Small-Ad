class Ad < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_attached_file :photo, :styles => { :medium => "250>x80>", :thumb => "90x90#" },  :default_url => "/images/default-:style-missing.png"
   
  attr_accessible :title, :description, :price, :category_id, :photo
  
  validates :title, :presence => true, :length => {:maximum => 60}
  validates :description, :presence => true, :length => { :in => 10..250 }
  validates :price, :presence => true, :numericality => {:greater_than => 0}
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg'] 
end


# == Schema Information
#
# Table name: ads
#
#  id                 :integer         not null, primary key
#  title              :string(255)
#  description        :text
#  price              :float
#  user_id            :integer
#  category_id        :integer
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string(255)
#  photo_content_type :string(255)
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#

