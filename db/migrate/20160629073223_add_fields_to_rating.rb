class AddFieldsToRating < ActiveRecord::Migration
  def change
  	add_column :ratings , :score , :int , default: nil
  	add_column :ratings , :recipe_id , :int
  	add_column :ratings , :user_id , :int
  end
end
