class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
			flash[:success] = "Welcome to bien, #{@user.full_name}"
    else
      redirect_to new_user_path, notice: 'Please Enter Valid Setails To Sign Up' 
    end
  end

  def show
    @user = User.find_by(user_name: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation, :email, :full_name)
  end
end
