class ReplController < ApplicationController
  respond_to :js, only: :run

  def demo
  end

  def run
    code = params[:repl].fetch(:code)

    julia_context = JuliaRemoteExecutionContext.new(code)

    @result = julia_context.execute(code)
  end
end
