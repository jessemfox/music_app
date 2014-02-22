# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string(255)
#  password_digest :string(255)
#  session_token   :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password
  before_validation :set_token
  validates :email, :password_digest, :session_token, presence: true
  validates :email, uniqueness: true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  
  has_many :notes
  
  def password=(pt)
    @password = pt
    self.password_digest = BCrypt::Password.create(pt)
  end
  
  def is_password?(pt)
    BCrypt::Password.new(self.password_digest).is_password?(pt)
  end
  
  def self.find_by_credentials(email, pt)
    return nil unless User.find_by_email(email)
    user = User.find_by_email(email)
    user.is_password?(pt) ? user : nil
    
  end
  
  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
  end
  
  def set_token
    self.session_token ||= self.reset_session_token!
  end

end
