require 'rails_helper'

describe "Interactive Web Repl", pending: true do
  before do
    visit "/demo"
  end

  it "renders success" do
    expect(page).to have_content("Repl Demo!")
  end

  describe "entering code and submitting" do
    before do
      fill_in("repl_code", with: 'println("Hello, world!")')
      click_button("Run")
    end

    it "responds with 'OK'" do
      expect(page.status_code).to eq(200)
    end
  end
end
