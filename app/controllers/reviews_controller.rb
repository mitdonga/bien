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
    if @review.save
      redirect_to @review
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    redirect_to root_path, status: :see_other
  end


  private

  def review_params
    params.require(:review).permit(:title, :restaurant, :price, :address, :cuisine, :body, :score, :phone_number, :ambiance)
  end

  def comment_params
    params.require(:comment).premit(:comment, :commenter)
  end

end
