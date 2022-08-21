class CommentsController < ApplicationController

  def new
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)

    if @comment.save
      redirect_to review_path(@review)
    end
  end

  def update
    @review = Review.find(params[:review_id])
    if @review.comments.update(comment_params)
      redirect_to review_path(@review)
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @comment = @review.comments.find(params[:id])
    @comment.destroy
    redirect_to review_path(@review), status: :see_other
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commenter)
  end

end
