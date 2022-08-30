class BookmarksController < ApplicationController

  before_action :check_login

  # def index
  #   @bookmarks = Bookmark.
  # end

  def show
    @bookmarks = Bookmark.where(user_id: @current_user.id)
  end

  def create
    @review = Review.find(params[:review_id])
    @bookmark = @review.bookmarks.new
    @bookmark.user = @current_user
    if @bookmark.save
      redirect_to review_path(@review)
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @bookmark = @review.bookmarks.where(user: @current_user)
    if @bookmark.destroy_all
      redirect_to review_path(@review), status: :see_other
    end
  end

end
