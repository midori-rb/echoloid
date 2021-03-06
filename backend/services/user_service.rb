DIGEST = Digest::SHA2.new

class UserService
  class << self
    def auth(request)
      user = UserToken.find(token: request.header['Token'] || request.header['token'])&.first
      user.nil? ? nil : User.where(id: user.user_id)&.first
    end

    def auth!(request)
      user = auth(request)
      user.nil? ? raise(UnauthorizedError) : user
    end

    def get_token(id)
      token = SecureRandom.uuid62
      UserToken.create(token: token, user_id: id)
      token
    end

    def salt(password, suffix)
      5.times { password = DIGEST.digest(password + suffix) }
      password.unpack('H*')[0]
    end

    def generate_password(password)
      suffix = SecureRandom.hex 8
      "#{salt(password, suffix)}:#{suffix}"
    end

    def register(username, password, usergroup)
      raise UserConflictError unless User.where(username: username)&.first.nil?
      User.create(
        username: username,
        password: generate_password(password),
        usergroup: usergroup,
      )
    end

    def login(username, password)
      user = User.where(username: username)&.first
      raise UnauthorizedError if user.nil?
      salted = user.password.split(':')
      raise UnauthorizedError unless salt(password, salted[1]) == salted[0]
      token = SecureRandom.uuid62
      UserToken.create(token: token, user_id: user.id)
      {
        id: user.id,
        username: user.username,
        usergroup: user.usergroup,
        token: token,
      }
    end
  end
end
