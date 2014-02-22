class ChangeAlbums < ActiveRecord::Migration
  def change
    remove_index :albums, :band_id
    add_index :albums, :band_id, :unique => false
  end
end
