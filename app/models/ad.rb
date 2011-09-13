class Ad < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
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
