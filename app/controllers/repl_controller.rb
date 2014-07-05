class ReplController < ApplicationController
  respond_to :js, only: [:run, :fail_to_connect]
  before_filter :save_snippet_to_current_user
  layout false, only: :run

  def demo
    @snippet = Snippet.new
  end

  def run
    code = params["snippet"].fetch("code")

    # This is a blocking call
    response_hash = JuliaRemoteExecutionContext.safe_eval(code)

    @output    = response_hash.fetch(:output)
    @result    = response_hash.fetch(:result)
    @exception = response_hash.fetch(:exception)

    respond_to do |format|
      format.js
    end
  rescue JuliaRemoteExecutionContext::JuliaExecutionError => e
    respond_to do |format|
      format.js {
        render action: :fail_to_connect
      }
    end
  end

  def fail_to_connect

  end

  private

  def save_snippet_to_current_user

  end
end
