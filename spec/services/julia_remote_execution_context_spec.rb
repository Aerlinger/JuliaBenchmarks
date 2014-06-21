require 'rails_helper'

describe JuliaRemoteExecutionContext do
  attr_reader :code

  def initialize(code)
    @code = code
  end

  class << self
    def remote_call(code)
      http_url = ENV['JULIA_SERVER_URL']
    end
  end
end
