class User < ActiveRecord::Base
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

