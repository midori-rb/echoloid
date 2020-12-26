define_error :unauthorized_error,
             :user_conflict_error,
             :not_found_error

class ErrorRoute < Midori::API
  capture NotFoundError do
    Midori::Response.new(
      status: 404,
      body: { message: 'Not Found' }.to_json
    )
  end

  capture UnauthorizedError do
    Midori::Response.new(
      status: 401,
      body: { message: 'Unauthorized' }.to_json
    )
  end

  capture UserConflictError do
    Midori::Response.new(
      status: 409,
      body: { message: 'Username has been taken' }.to_json
    )
  end
end
