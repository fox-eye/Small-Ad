class Ad < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  
  attr_accessible :title, :description, :price, :category_id
  
  validates :title, :presence => true, :length => {:maximum => 60}
  validates :description, :presence => true, :length => { :in => 10..250 }
  validates :price, :presence => true, :numericality => {:greater_than => 0} 
end

# == Schema Information
#
# Table name: ads
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  price       :float
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

