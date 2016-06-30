class AddFieldsToIngredients < ActiveRecord::Migration
  def change
  	add_column :ingredients , :recipe_id , :int , default: nil
  end
end
