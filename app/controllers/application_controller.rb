class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? # So that it can be used in views as well
    
    def current_user # Has to be placed here otherwise in application.html.erb it was only accessible to views, and undefined to methods
        @current_user ||= User.find(session[:user_id]) if session[:user_id] #Memoization to only hit the DB with query when the value isn't there.
    end

    def logged_in?
        !!current_user
    end

    def require_user
        if !logged_in?
            flash[:alert] = "You must be logged in to perform this action!"
            redirect_to login_path
        end
    end
   
end
