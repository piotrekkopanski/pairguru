require "rails_helper"

RSpec.feature "Adding comments", :type => :feature do
  let!(:movie) { FactoryBot.create(:movie) }
  let!(:movie_2) { FactoryBot.create(:movie) }
  let!(:movie_3) { FactoryBot.create(:movie) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:comment) { FactoryBot.create(:comment, movie: movie_2, user: user, description: "Comment User") }
  before do
    visit '/users/sign_in'
    find('#user_email').set 'email@example.pl'
    find('#user_password').set 'password'
    click_button "Log in"
  end

  scenario "User creates a new comments" do
    visit "/movies/1"
    find('#comment_description').set 'Comment 1'
    click_button "Create Comment"
    expect(page).to have_text("Comment was successfully created.")
  end

  scenario "User can't creates a second comment for the same movie" do
    visit "/movies/2"
    find('#comment_description').set 'Comment 1'
    click_button "Create Comment"
    expect(page).to have_text("You've already made a comment!")
  end

  scenario "User can't creates a comment without description" do
    visit "/movies/3"
    click_button "Create Comment"
    expect(page).to have_text("description can't be blank")
  end

  scenario "Not logged in user can't creates a new comment" do
    click_link "Logout"
    visit "/movies/3"
    expect(page).not_to have_text("Create Comment")
  end

  scenario "User can delete his comment" do
    visit "/movies/2"
    click_link "Delete"
    expect(page).not_to have_text("Comment User")
  end

  scenario "User can add a comment after removing the previous one" do
    visit "/movies/2"
    click_link "Delete"
    visit "/movies/2"
    find('#comment_description').set 'Comment 1'
    click_button "Create Comment"
    expect(page).to have_text("Comment was successfully created.")
  end
end
