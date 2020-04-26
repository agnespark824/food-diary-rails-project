class SessionsController < ApplicationController
    def new
    end

    def create
#look up user in database
#verify login credentials
#store authenticated user's id in session
        @user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
        
            redirect_to root_path
        else
            render 'sessions/new'
        end
    end

end