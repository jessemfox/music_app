# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  band_id    :integer          not null
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#  album_type :string(255)
#

class Album < ActiveRecord::Base

  belongs_to :band
  has_many :tracks, :dependent => :destroy
  validates :band_id, :name, :album_type, :presence => true
  
end
