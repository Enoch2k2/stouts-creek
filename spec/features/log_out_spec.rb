require 'rails_helper'

RSpec.feature "Log Out", type: :feature do
  let(:user){ create(:user) }

  it "can log out" do
    visit root_path
    click_link "Log In"
    fill_in "user_email", with: user.email
    fill_in "user_password", with: user.password
    click_button "Log in"
    expect(page).to have_content("Log Out")

    click_link "Log Out"
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Log In")
  end
end
