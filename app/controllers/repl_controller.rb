class ReplController < ApplicationController
  respond_to :js, only: :run

  def demo
  end

  def run
    code = params[:repl].fetch(:code)

    response_hash = JuliaRemoteExecutionContext.safe_eval(code)

    @output    = response_hash.fetch(:output)
    @result    = response_hash.fetch(:result)
    @exception = response_hash.fetch(:exception)
  end
end
