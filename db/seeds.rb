# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'faker'

def random_in_range(min,max)
  min = min.to_i
  max = max.to_i
  arr = (min..max).to_a;
  arr.at(rand(arr.length))
end

def rand_sub_cat
  pos = rand(hash.size)
  key = hash.keys[pos]
  hash[key]
end

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

# ad some users and their ads
15.times do
   
  # créer un nouvel utilisateur
  user = User.create({:first_name => Faker::Name::first_name,
               :last_name => Faker::Name::last_name,
               :email => Faker::Internet::email,
               :city => Faker::Address::city,
               :password => "test123",
               :password_confirmation => "test123"
              })
              
  # Générer 5 nouvelles annonces dans des sous catégories en random pour cet utilisateur
  5.times do
    #choisir une sous categorie au hasard dans une catégorie choisie au hasard
    subcategories = rand_sub_cat(categories)
    subcategory_name = categories[rand(categories.size)]
    
    # trouver l'id de la sous catégorie
    subcategory_id = Category.find_by_name(subcategory_name)
    
    ad = user.ads.build({
                    :title => Faker::Lorem.words(random_in_range(4,10)),
                    :description => Faker::Lorem.sentences(random_in_range(1,4)),
                    :price => random_in_range(10,250)
                  })
                  
    ad.category_id = subcategory_id
    
    ad.save
  end
end
