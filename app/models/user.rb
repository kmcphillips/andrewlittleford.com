class User < ActiveRecord::Base
  validates :password_hash, presence: true
  validates :username, uniqueness: true, presence: true

  def self.authenticate(opts)
    username = opts[:username]
    password = opts[:password]
    password_confirm = opts[:password_confirm] || opts[:password]

    return nil if password.blank? || password_confirm.blank? || username.blank? || (password_confirm.strip != password.strip)

    User.where(username: username.strip, password_hash: encrypt(password.strip)).first
  end

  def self.encrypt(password)
    Digest::SHA1.hexdigest password
  end

  def change_password!(password, password_confirm)
    if password && password_confirm
      if password == password_confirm
        if password.length >= 4
          self.update_attributes(password_hash: User.encrypt(password))
        else
          self.errors.add :base, "Password must be at least four characters."
        end
      else
        self.errors.add :base, "Passwords do not match."
      end
    else
      self.errors.add :base, "Password was not passed for update."
    end

    !self.errors.any?
  end
end
