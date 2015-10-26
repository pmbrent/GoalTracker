require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  it "has a new user page" do
    visit "/users/new"
    expect(page).to have_content "Sign Up"

  end

  feature "signing up a user" do

    it "shows username on the homepage after signup" do
      visit "/users/new"
      fill_in "Username", with: "ginger_baker"
      fill_in "Password", with: "abcdef"
      click_button "Sign Up"
      expect(page).to have_content "ginger_baker"

    end

  end

end

feature "logging in" do

  it "shows username on the homepage after signin" do

    visit "/session/new"
    fill_in "Username", with: "ginger_baker"
    fill_in "Password", with: "abcdef"
    click_button "Sign In"
    expect(page).to have_content "ginger_baker"

  end

end

feature "logging out" do

  it "begins with logged out state"

  it "doesn't show username on the homepage after logout"

end
