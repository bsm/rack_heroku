# Appends a X-Heroku-Queue-Wait header to the response
class Rack::Heroku::Profiler
  VALS_RANGE = (0..120_000).freeze
  REQ_HEADER = "HTTP_X_REQUEST_START".freeze
  RES_HEADER = "X-Heroku-Queue-Wait".freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    ms = time_since env[REQ_HEADER]
    status, headers, body = @app.call(env)
    headers.update RES_HEADER => ms.to_s if ms && VALS_RANGE.include?(ms)

    [status, headers, body]
  end

  private

    def time_since(start)
      (Time.now.to_f * 1_000).to_i - start.to_i if start
    end

end
