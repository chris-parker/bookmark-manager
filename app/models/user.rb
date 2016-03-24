require 'bcrypt'
require 'dm-core'
require 'dm-validations'

class User
  include DataMapper::Resource


  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :username, String, :lazy => false
  property :email, Text, :lazy => false
  property :password_digest, Text, :lazy => false

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
