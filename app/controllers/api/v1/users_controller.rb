class Api::V1::UsersController < ApplicationController

    skip_before_action :authorized, only: [:create]

    def profile 
        UserSerializer.new(currentUser)
        render json: { user: UserSerializer.new(currentUser)}
    end

    def create 
        @user = User.new(user_params)
        if @user.valid? 
            @user.save
            @token = encode_token(@user)
            render json: { user: UserSerializer.new(@user), jwt: @token }
            
        else
            render json: { error: 'failed to create user'},status: :not_acceptable
       
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render json: @user
    end

    def destroy 
        @user = User.find(params[:id])
        if @user 
            @user.destroy 
            render json: {message: "Account was successfully deleted"}
        else 
            render json: {message: "Failed to destroy user account"}
        end
    end
    
    private
    def  user_params
        params.require(:user).permit(:username, :password_digest)
    end
end
