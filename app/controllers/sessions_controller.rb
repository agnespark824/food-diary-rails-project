class SessionsController < ApplicationController
    def new
    end

    def create
#look up user in database
#verify login credentials
#store authenticated user's id in session
        @user = User.find_by(username: params[:username])
        session[:username] = params[:username]
        redirect_to '/'
    end

end