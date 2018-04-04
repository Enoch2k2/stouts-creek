require 'rails_helper'

RSpec.feature "Navs", type: :feature do
  let(:user){create(:user)}
  describe "User Logged Out" do
    it "should have Stouts Creek displayed in nav" do
      visit root_path
      expect(page).to have_content("Stouts Creek")
    end

    it "should have link for sign up" do
      visit root_path
      expect(page).to have_content("Sign Up")
    end

    it "should have link for log in" do
      visit root_path
      expect(page).to have_content("Log In")
    end
  end

  describe "User Signed In" do
    it "should show account drop down" do
      visit root_path
      click_link "Log In"
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Log in"
      expect(page).to have_content("Cart")
      expect(page).to have_content(user.first_name)
      expect(page).to have_content("Log Out")
      expect(page).to have_content("About")
    end

    it "should not show Log In and Sign Up" do
      visit root_path
      click_link "Log In"
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Log in"
      expect(page).to_not have_content("Sign In")
      expect(page).to_not have_content("Log In")
    end
  end
end
