require 'spec_helper'
require 'rails_helper'

feature "add comment on user" do

  it "should add a comment" do
    sign_up_as_ginger_baker
    click_button "Sign Out"
    sign_up_as_user2
    visit "/users/1"
    fill_in "Comment", with: "You can do it!"
    click_button "Add Comment"
    expect(page).to have_content("You can do it!")
  end


end

feature "add comment on goal" do

  it "should add a comment to existing goal" do
    sign_up_as_ginger_baker
    visit "/users/1"
    fill_in "Goal Title", with: "learn capybara"
    click_button "Add Goal"
    click_button "Sign Out"
    sign_up_as_user2
    visit "/users/1"
    click_link "learn capybara"
    fill_in "Comment", with: "You can do it!"
    click_button "Add Comment"
    expect(page).to have_content("You can do it!")
  end

end

feature "remove comment from user" do

end

feature "remove comment from goal" do

end
