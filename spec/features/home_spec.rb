require 'rails_helper'

describe "Home Page" do
  before do
    visit "/"
  end

  it "has corect text" do
    expect(page).to have_text("Julia Benchmarks")
  end
end
