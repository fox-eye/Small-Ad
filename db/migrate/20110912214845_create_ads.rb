class CreateAds < ActiveRecord::Migration
  def self.up
    create_table :ads do |t|
      t.string :title
      t.text :description
      t.float :price
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
    
    add_index :ads,:category_id
    add_index :ads,:user_id
  end

  def self.down
    drop_table :ads
  end
end
