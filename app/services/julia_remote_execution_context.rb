require 'net/http'
require 'active_support/all'

class JuliaRemoteExecutionContext
  class JuliaExecutionError < StandardError
  end

  class << self
    def safe_eval(code)
      @url  = Rails.application.secrets.julia_server_url
      @port = Rails.application.secrets.julia_server_port

      http_response = call(code, "#{@url}:#{@port}")

      process_response(http_response)
    rescue => e
      message = "Could not evaluate response from remote server: (#{e.class})"

      Rails.logger.error message

      raise JuliaExecutionError, message
    end

    def process_response(response)
      HashWithIndifferentAccess.new ActiveSupport::JSON.decode(response)
    end

    def call(code, uri)
      Net::HTTP.post_form(URI(uri), 'code' => code).body
    end
  end
end
