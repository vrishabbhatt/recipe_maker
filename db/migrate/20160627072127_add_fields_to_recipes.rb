class AddFieldsToRecipes < ActiveRecord::Migration
  def change
  	add_column :recipes ,:title ,:string
  	add_column :recipes ,:description ,:text
  end
end
