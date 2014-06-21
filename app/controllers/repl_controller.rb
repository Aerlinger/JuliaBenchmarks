class ReplController < ApplicationController
  respond_to :js, only: :run
  before_filter :save_snippet_to_current_user

  def demo
    @snippet = Snippet.new
  end

  def run
    code = params[:repl].fetch(:code)

    # This call blocks until return
    response_hash = JuliaRemoteExecutionContext.safe_eval(code)

    @output    = response_hash.fetch(:output)
    @result    = response_hash.fetch(:result)
    @exception = response_hash.fetch(:exception)
  end

  private

  def save_snippet_to_current_user

  end
end
