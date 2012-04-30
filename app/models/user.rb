# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  username        :string(255)
#  password_digest :string(255)
#  remember_token  :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :username, :password, :password_confirmation
  has_secure_password

  before_save {|user| user.username = username.downcase}
  before_save :create_remember_token

  validates :username, presence: true


  private

  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
