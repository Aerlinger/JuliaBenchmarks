require 'rails_helper'

describe "Interactive Web Repl" do
  before do
    visit "/demo"
  end

  it "renders success" do
    expect(page.status_code).to eq 200
  end
end
