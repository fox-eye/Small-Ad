class Category < ActiveRecord::Base
  has_ancestry
  has_many :ads
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

