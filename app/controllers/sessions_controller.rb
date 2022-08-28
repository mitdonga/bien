class SessionsController < ApplicationController

    def new

    end

    def create
        @form_data = params.require(:session)
        @user_name = @form_data[:user_name]
        @password = @form_data[:password]

        @user =  User.find_by(user_name: @user_name).try(:authenticate, @password)
        
        if @user
            @error = nil
            session[:user_id] = @user.id
            redirect_to root_path
        else
            @error = "User Authentication Failed"
            render :new
        end
    end

    def destroy
        reset_session
        redirect_to new_session_path
    end

    private
    
    def login_data
        
    end

end
