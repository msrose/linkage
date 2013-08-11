class User < ActiveRecord::Base
  has_many :groups, :dependent => :destroy
  has_many :links, :through => :groups
  has_many :colors, :dependent => :destroy
  has_secure_password

  validates :name, :email, :password_digest, :presence => true
end
