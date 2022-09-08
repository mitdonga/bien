class AccountsController < ApplicationController

	before_action :check_login

	def edit
	end

	def update
		if @current_user.update(account_params)
			flash[:success] = "Account was updated successfully"
			redirect_to root_path
		else
			render 'edit'
		end
	end

	private

	def account_params
		params.require(:user).permit(:email, :password, :password_confirmation, :full_name)
	end


end
