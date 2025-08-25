class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path  
        else
            message = "Usuário já existente no banco de dados."
                # na model do user, defini que ele precisa ser único
            render :new, notice: message
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end