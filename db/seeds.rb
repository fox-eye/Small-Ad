# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#add categories for ads
categories = {
              "musical instruments" => ["string instruments","electric string instruments","wind instrument","percussion instrument"],
              "hi-fi equipment" => ["digital video recorders","dvd players","blu-ray players","radio","tv's"],
              "video games" => ["portable video game system","home game console","games all platforms"],
              "clothes" => ["t-shirts","skirts","dresses","coats","hats","man pants","women pants","man sweaters","women sweaters"],
              "vehicles" => ["cars","motorbikes","bicycles","vans","trucks"]
        }
          

categories.each do |category_name,subcat|
  category = Category.create(:name => category_name)
  subcat.each do |subcat_name|
    category.children.create(:name => subcat_name)
  end
end