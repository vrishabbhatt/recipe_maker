class LinkRecipieToUser < ActiveRecord::Migration
  def change
  	add_column :recipes , :user_id , :int , default: nil
  end
end
