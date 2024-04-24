# frozen_string_literal: true

require 'rack'

class Router
  def call(env)
    # BEGIN
    request = Rack::Request.new env
    if request.request_method == 'GET'
      if request.path == '/'
        return [200, {}, ["Hello, World!"]]
      elsif request.path == '/about'
        return [200, {}, ["About page"]]
      end
    end

    [404, {}, ["404 Not Found"]]
    # END
  end
end
