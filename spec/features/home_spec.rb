require 'rails_helper'

describe "Home Page" do
  before do
    visit "/"
  end

  it "has correct text" do
    expect(page).to have_text("Julia Benchmarks")
  end

  describe "Login", pending: true do
    before do
      click_link "login"
    end

    it "redirects to the login page" do
      expect(page.status_code).to eq(200)
    end
  end

  describe "Create Account", pending: true do
    before do
      click_link "Create account"
    end

    it "redirects to the create account page" do
      expect(page.status_code).to eq(200)
    end
  end
end
