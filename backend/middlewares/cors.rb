class CorsMiddleware < Midori::Middleware
  def before(request)
    if request.method == :OPTIONS
      # PREFLIGHT
      return Midori::Response.new(
        header: {
          'Access-Control-Allow-Origin': request.header['Origin'],
          'Access-Control-Request-Headers': 'Token',
        }
      )
    else
      request
    end
  end

  def after(request, response)
    response.header['Access-Control-Allow-Origin'] = request.header['Origin']
    response.header['Access-Control-Expose-Headers'] = 'Token'
    response
  end
end
