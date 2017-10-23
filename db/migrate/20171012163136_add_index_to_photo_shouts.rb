class AddIndexToPhotoShouts < ActiveRecord::Migration[5.1]
  def change
  	change_column :photo_shouts, :image_file_name, :string, null: false
  end
end
