class CommentsController < ApplicationController

  before_action :check_login, except: [:index, :show]

  def new
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    @comment.user = @current_user

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
    if @comment.user = @current_user
      @comment.destroy
      redirect_to review_path(@review), status: :see_other
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :commenter)
  end

end
