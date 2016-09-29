class RemoveImageFromUser < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :avatar
  	remove_column :users, :image_file_name
  	remove_column :users, :image_content_type
  	remove_column :users, :image_file_size
  	remove_column :users, :image_updated_at
  end
end
