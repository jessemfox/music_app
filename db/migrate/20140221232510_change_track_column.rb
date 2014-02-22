class ChangeTrackColumn < ActiveRecord::Migration
  def change
    remove_column :tracks, :type
    add_column :tracks, :track_type, :string
  end
end
