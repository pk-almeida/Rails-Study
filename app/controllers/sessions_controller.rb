class SessionsController < ApplicationController

    def create
        @user = User.find_by(username: params[:username])

        if !!@user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to todos_path
        else
            message = "Login ou senha incorreto."
            redirect_to login_path, notice: message
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end

end