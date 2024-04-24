# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    prev_response = @app.call(env)
    status, headers, response = prev_response

    return prev_response if status != 200

    response.push(Digest::SHA256.hexdigest(response.join))
    [status, headers, response]
    # END
  end
end
