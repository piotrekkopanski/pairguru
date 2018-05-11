# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :user_id, uniqueness: { scope: :movie_id, message: "You've already made a comment!" }
  validates :description, presence: true
end
