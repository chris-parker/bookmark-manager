require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, :lazy => false
  property :email, Text, :lazy => false
  property :password_digest, Text, :lazy => false

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

end
