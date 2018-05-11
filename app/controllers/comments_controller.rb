class CommentsController < ApplicationController
  def create
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.create(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @movie, notice: "Comment was successfully created." }
      else
        format.html { redirect_to @movie, flash[:error] = @comment.errors }
      end
    end
  end

  def destroy
    @movie = Movie.find(params[:movie_id])
    @comment = @movie.comments.find(params[:id])
    @comment.destroy if @comment.user == current_user
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:description, :user_id, :movie_id)
  end
end
