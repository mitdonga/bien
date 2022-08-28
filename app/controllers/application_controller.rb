class ApplicationController < ActionController::Base

    before_action :find_current_user

    helper_method :is_logged_in?

    def find_current_user
        if is_logged_in?
            @current_user = User.find(session[:user_id])
        else
            puts ">>>>>>>>>>>>>>>>>>>>>>>>>>>>> You are not the writer of this review or comment <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
            @current_user = nil
        end
    end

    def check_login
        unless is_logged_in?
            redirect_to new_session_path
        end
    end

    def is_logged_in?
        session[:user_id].present?
    end
end
