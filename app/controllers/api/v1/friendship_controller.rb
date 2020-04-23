class Api::V1::FriendshipController < ApplicationController

    def index 
        @friendships = currentUser.friendships
        render json: @friendships
    end

    render json: { error: 'failed to create user'},status: :not_acceptable

    def create 
        @user = current_user 
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        if !current_user.friends.exists?(@user.id)
            @friendship.save 
            render json: {message: "Added friend! :)" }
   
        else 
            render json: {error: "Unable to add friend :("}, status: :not_acceptable
        end
    end


    def destroy
        @friendship = current_user.friendships.find(params[:id])
        @friendship.destroy
        render json: {message: "Removed friend"}
      end

end
