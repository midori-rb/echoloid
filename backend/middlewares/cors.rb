class CorsMiddleware < Midori::Middleware
  def before(request)
    if request.method == :OPTIONS
      # PREFLIGHT
      return Midori::Response.new(
        header: {
          'Access-Control-Allow-Origin': request.header['Origin'],
          'Access-Control-Request-Headers': 'Token',
          'Access-Control-Allow-Headers': 'Token',
          'Access-Control-Allow-Methods': 'OPTIONS, POST, PUT, DELETE',
        }
      )
    else
      request
    end
  end

  def after(request, response)
    response.header['Access-Control-Allow-Origin'] = request.header['Origin']
    response
  end
end
