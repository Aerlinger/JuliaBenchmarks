require 'pp'

begin
  pp JuliaRemoteExecutionContext.safe_eval('println("Hello from Julia server!")')
rescue
  puts("Call to Julia server failed!")
end
