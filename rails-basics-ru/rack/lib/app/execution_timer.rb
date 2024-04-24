# frozen_string_literal: true

class ExecutionTimer
  def initialize(app)
    @app = app
  end

  def call(env)
    # BEGIN
    start = Process.clock_gettime(Process::CLOCK_REALTIME, :microsecond)
    status, headers, response = @app.call(env)
    finish = Process.clock_gettime(Process::CLOCK_REALTIME, :microsecond)
    elapsed_microseconds = (finish - start)
    response << "Выполнялось: #{elapsed_microseconds.to_i} µs\n"
    [status, headers, response]
    # END
  end
end
