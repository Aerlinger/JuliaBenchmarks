require 'rails_helper'

describe ReplController do
  describe "post #run" do
    before do
      stub_const("JuliaRemoteExecutionContext", Class.new).stub(:new).and_return(double(execute: "<Evaluation result stub>"))

      xhr :post, "run", repl: { code: "println(\"hello\")" }
    end

    it { expect(assigns(:result)).to eq("<Evaluation result stub>") }
  end
end
