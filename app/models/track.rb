# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  lyrics     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  track_type :string(255)
#  title      :string(255)
#

class Track < ActiveRecord::Base


  belongs_to :album
  has_many :notes, dependent: :destroy
  validates :album_id, :track_type,:title, presence: true

end
