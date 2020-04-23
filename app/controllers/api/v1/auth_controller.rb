class Api::V1::AuthController < ApplicationController

    skip_before_action :authorize, only: [:create]

    def create 
        @user = User.find_by(username: user_login_params[:username])
        if @user && @user.authenticate(user_login_params[:password])
            @token = encode_token(@user)
            render json: {user: UserSerializer.new(@user), jwt: @token}
        else 
            render json: {error: 'Invalid username or password'}, status: :unauthorized
        end
    end

    def show 
        @user = User.find_by(id: user_id)
        if logged_in? 
            render json: {id: @user.id, username: @user.username}
        else 
            render json: {error: 'No user could be found'}, status: 401
        end
    end

    private 
    
    def user_login_params
        params.require(:auth).permit(:username, :password)
    end
end
