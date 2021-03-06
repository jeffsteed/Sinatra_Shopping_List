class Account < ActiveRecord::Base

  include BCrypt

  #password setter
  def password=(pwd)
    return self.password_digest = BCrypt::Password.create(pwd)
  end

  #password getter
  def password
    return BCrypt::Password.new(self.password_digest)
  end

  def self.authenticate(user_name, password)
    current_user = Account.find_by(user_name: user_name)
    if (current_user.password == password) #This uses the password getter method above "current_user.password"
      return current_user
    else
      return nil
    end
  end

end
