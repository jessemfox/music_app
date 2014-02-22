# == Schema Information
#
# Table name: bands
#
#  id           :integer          not null, primary key
#  name         :string(255)      not null
#  genre        :string(255)
#  band_pic_url :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Band < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  has_many :albums, dependent: :destroy


end
