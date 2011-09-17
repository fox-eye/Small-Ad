require 'spec_helper'

describe Ad do
  pending "add some examples to (or delete) #{__FILE__}"
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

