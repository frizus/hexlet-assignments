# frozen_string_literal: true

require 'digest'

class Signature
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    status, headers, response = @app.call(env)
    response << Digest::SHA256.hexdigest(response.first)
    [status, headers, response]
    # END
  end
end
