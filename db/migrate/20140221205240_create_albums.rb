class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      
      t.integer :band_id, :null => false
      t.string :name, :null => false
      t.string :type, :null => false
      
      t.timestamps
    end
    add_index :albums, :band_id, unique: true
  end
end
