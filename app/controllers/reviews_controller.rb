class ReviewsController < ApplicationController

  before_action :check_login, except: [:index, :show]

  def index
    price = params[:priceFtr]
    price_max = params[:priceFtrMax]
    @reviews = (price ?  Review.where("price >= ? AND price <= ?", price, price_max).order("score DESC") : Review.all.order("score DESC"))
  end

  def show
    @review = Review.find(params[:id])
    @comments = Review.find(params[:id]).comments
  end

  def new
      @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = @current_user
    if @review.save
      redirect_to @review
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
    if @review.user != @current_user
      redirect_to root_path
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.user == @current_user
      if @review.update(review_params)
        redirect_to review_path(@review)
      else
        render :edit, status: :unprocessable_entity
      end
    else 
      redirect_to root_path
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.user == @current_user
      @review.destroy
      redirect_to root_path, status: :see_other
    end 
  end


  private

  def review_params
    params.require(:review).permit(:title, :restaurant, :price, :address, :cuisine, :body, :score, :review_image, :phone_number, :ambiance)
  end

  def comment_params
    params.require(:comment).premit(:comment, :commenter)
  end

end
