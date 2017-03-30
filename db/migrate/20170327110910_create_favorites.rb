class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.references :user, null:false
      t.references :micropost, null:false

      t.timestamps null: false
    end
    
    add_index :favorites, :user_id
    add_index :favorites, :micropost_id 
  end
end
