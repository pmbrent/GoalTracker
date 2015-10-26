require 'spec_helper'
require 'rails_helper'

feature "creating goals" do

  it "saves and displays a new goal" do
    sign_up_as_ginger_baker
    visit "/users/1"
    fill_in "Goal Title", with: "learn capybara"
    click_button "Add Goal"
    expect(page).to have_content "learn capybara"
  end

end

feature "displays goals on user page" do

  it "doesn't displays goals to signed out users" do
    visit "/users/1"
    expect(page).to have_content "Sign In"
  end

end

feature "allows editing of goals" do

  it "has a link to edit a goal" do
    sign_up_as_ginger_baker
    visit "/users/1"
    fill_in "Goal Title", with: "learn capybara"
    click_button "Add Goal"
    expect(page).to have_content "Edit Goal"
  end

  it "edits the selected goal" do
    sign_up_as_ginger_baker
    visit "/users/1"
    fill_in "Goal Title", with: "learn capybara"
    click_button "Add Goal"
    click_link "Edit Goal"
    fill_in "Goal Title", with: "learn more capybara"
    click_button "Save Changes"
    expect(page).to have_content "learn more capybara"
  end

  it "has a button to remove goal" do
    sign_up_as_ginger_baker
    visit "/users/1"
    fill_in "Goal Title", with: "learn capybara"
    click_button "Add Goal"
    visit "/users/1"
    click_button "Remove"
    expect(page).to_not have_content "learn capybara"
  end

end

feature "only displays private goals to owner" do

  it "only shows public goals to other users" do
    sign_up_as_ginger_baker
    visit "/users/1"
    fill_in "Goal Title", with: "learn capybara"
    check "Private"
    click_button "Add Goal"
    click_button "Sign Out"
    sign_up_as_user2
    visit "/users/1"
    expect(page).to_not have_content "learn capybara"

  end

  it "shows private goals when signed in as owner" do
    sign_up_as_ginger_baker
    visit "/users/1"
    fill_in "Goal Title", with: "learn capybara"
    check "Private"
    click_button "Add Goal"
    expect(page).to have_content "learn capybara"
  end

end

feature "completed goals" do
  it "saves a goal as completed" do
    sign_up_as_ginger_baker
    visit "/users/1"
    fill_in "Goal Title", with: "learn capybara"
    click_button "Add Goal"
    visit "/users/1"
    click_button "Completed"
    expect(page).to have_content "Completed!"
  end
end
