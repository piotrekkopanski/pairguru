require "rails_helper"

RSpec.describe "comments/_comment", :type => :view do
  let!(:user) { FactoryBot.create(:user) }
  before do
    sign_in user
    movie = FactoryBot.create(:movie)
    comment = FactoryBot.create(:comment, :description => "comment_description", movie: movie, user: user)
    render :partial => "comments/comment.html.haml", :locals => { :comment => comment, :@movie => movie }
  end

  it "displays the comment" do
    expect(rendered).to match /comment_description/
  end

  it "displays link to delete" do
    expect(rendered).to have_link('Delete')
  end
end
