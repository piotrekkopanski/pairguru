require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user_2) { FactoryBot.create(:user) }
  let!(:movie_2) { FactoryBot.create(:movie) }
  let!(:comment_one) { FactoryBot.create(:comment, user: user_2, movie: movie_2) }
  before do
    @user = User.create(:name => "example_name")
    @movie = Movie.create(:title => "example_name")
  end

  it { should validate_presence_of :description }

  it "should require a user" do
    expect(FactoryBot.build(:comment, :user => nil, :movie => @movie)).not_to be_valid
  end

  it "should require a movie" do
    expect(FactoryBot.build(:comment, :user => @user, :movie => nil)).not_to be_valid
  end

  it "created with valid description, user and movie" do
    expect(FactoryBot.build(:comment, :user => @user, :movie => @movie)).to be_valid
  end

  it "not created second comment for the same user" do
    expect(FactoryBot.build(:comment, :user => user_2, :movie => movie_2)).not_to be_valid
  end
end
