require 'rails_helper'

describe ReplController do
  describe "post #run" do
    before do
      Net::HTTP.should_receive(:post_form).with anything, { "code" => "println(\"hello\")" } do
        OpenStruct.new.tap do |os|
          os.body = <<-RES
            {
              "output": "hello",
              "result": "true",
              "exception": ""
            }
          RES
        end
      end

      xhr :post, "run", repl: { code: "println(\"hello\")" }
    end

    it { expect(assigns(:output)).to eq("hello") }
    it { expect(assigns(:result)).to eq("true") }
    it { expect(assigns(:exception)).to eq("") }
  end
end
