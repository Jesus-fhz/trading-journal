class ApplicationController < ActionController::Base

    before_action :fetch_user

    def fetch_user 
        if session[:user_id].present?
            @current_user = User.find_by id: session[:user_id]
        end
        session[:user_id] = nil unless @current_user.present?
    end 

    def check_if_logged_in
        unless @current_user.present?
            flash[:error] = "You must  be logged in!"
            redirect_to login_path
        end
    end

    def create_session(email, password)
        user = User.find_by email: email
        if user.present? && user.authenticate(password)
            session[:user_id] = user.id
            redirect_to trades_path
        else
        #Either user was nill or invalid password
            redirect_to login_path
            flash[:error] = "Bad Credentials, try again."
        end
    end
end
