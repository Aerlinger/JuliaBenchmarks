class ReplController < ApplicationController
  respond_to :js, only: :run
  before_filter :save_snippet_to_current_user
  layout false, only: :run

  def demo
    @snippet = Snippet.new
  end

  def run
    code = params["snippet"].fetch("code")

    # This call blocks until return
    response_hash = JuliaRemoteExecutionContext.safe_eval(code)

    @output    = response_hash.fetch(:output)
    @result    = response_hash.fetch(:result)
    @exception = response_hash.fetch(:exception)

    respond_to do |format|
      format.js #{ layout: false }
    end
  end

  private

  def save_snippet_to_current_user

  end
end
