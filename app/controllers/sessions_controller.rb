class SessionsController < ApplicationController

    def new
    end
    
    def create
        # debugger
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
            #Sessions enable the applications to maintain user specific state
            # Rails provides a session object which we can access using a session instance method for each user that access the application
            session[:user_id] = user.id # This is the session instance method by which we can access the session object associated with the user
            flash[:notice] = "Logged in successfully!"
            redirect_to user
        else
            flash.now[:alert] = "There was something wrong with your login details!"
            render 'new'
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out!"
        redirect_to root_path
    end
end