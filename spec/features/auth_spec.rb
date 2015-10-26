require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit "/users/new"
    expect(page).to have_content "Sign Up"

  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      sign_up_as_ginger_baker
      expect(page).to have_content "ginger_baker"

    end

  end

end

feature "logging in" do

  it "shows username on the homepage after signin" do
    sign_in_as_ginger_baker

    visit "/session/new"
    fill_in "Username", with: "ginger_baker"
    fill_in "Password", with: "abcdef"
    click_button "Sign In"
    expect(page).to have_content "ginger_baker"

  end

end

feature "logging out" do

  it "begins with logged out state" do
    sign_up_as_ginger_baker
    click_button "Sign Out"
    visit "/users/1"
    expect(page).to have_content "Sign In"
  end

  it "doesn't show username on the homepage after logout" do
    sign_up_as_ginger_baker
    click_button "Sign Out"
    expect(page).to_not have_content("ginger_baker")
  end

end
