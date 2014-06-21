require 'rails_helper'

describe ReplController do
  describe "get #demo" do
    before do
      @user = FactoryGirl.create :user
      @snippet = FactoryGirl.create :snippet

      get "demo"
    end

    it { expect(assigns(:snippet)).to be_a_new(Snippet) }
  end

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
