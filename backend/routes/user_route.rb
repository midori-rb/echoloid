class UserRoute < Midori::API
  post '/register' do
    user = UserService.auth!(request)
    raise UnauthorizedError unless user.admin?
    req = JSON.parse(request.body)
    UserService.register(
      req['username'],
      req['password'],
      req['usergroup'],
    )
    @status = 201
    {}.to_json
  end

  post '/login' do
    req = JSON.parse(request.body)
    UserService.login(req['username'], req['password']).to_json
  end

  get '' do
    user = UserService.auth!(request)
    raise UnauthorizedError unless user.admin?
    User.all.map do |row|
      {
        id: row.id,
        username: row.username,
        usergroup: row.usergroup,
        created_time: row.created_time,
      }
    end.to_json
  end

  put '' do
    # User himself changing password
    user = UserService.auth!(request)
    req = JSON.parse(request.body)
    user.update(
      password: UserService.generate_password(req['password'])
    )
    {}.to_json
  end

  put '/:user_id' do
    user = UserService.auth!(request)
    raise UnauthorizedError unless user.admin?
    val = { usergroup: req['usergroup'] }
    val[:password] = req['password'] unless req['password'].nil?
    User.where(id: request.params['user_id'])&.first&.update(val)
    {}.to_json
  end
end
