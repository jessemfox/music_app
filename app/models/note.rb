# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  track_id   :integer
#  user_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

class Note < ActiveRecord::Base


  
  validates :user_id, :track_id, :body, presence: true
  belongs_to :user
  belongs_to :track
end
