require "rails_helper"

RSpec.describe "movies/show", :type => :view do
  let!(:genre) { FactoryBot.create(:genre) }
  let!(:user) { FactoryBot.create(:user) }
  let!(:movie) { FactoryBot.create(:movie) }
  before do
    sign_in user
    assign(:movie, Movie.create!(:title => "slicer", genre: genre))
    assign(:comment, Comment.create!(:description => "comment_description", user: user, movie: movie))
    render :template => "movies/show.html.haml"
  end

  it "displays the movie" do
    sign_in user
    assign(:movie, Movie.create!(:title => "slicer", genre: genre))
    render :template => "movies/show.html.haml"
    expect(rendered).to match /slicer/
  end

  it "displays the comment" do
    expect(rendered).to match /comment_description/
  end
end
