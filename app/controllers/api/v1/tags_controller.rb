class Api::V1::TagsController < ApplicationController

    def index 
        @tags = Tags.all 
        render json: @tags
    end

    def create 
        @tag = Tag.new(tag_params)
        if @tag.valid? 
            @tag.save 
            render json: { Tag: TagSerializer.new(@tag)}
        else 
            render json: { error: "failed to create event"}, status: :not_acceptable 
        end
    end

    def show 
        @tag = Tag.find(params[:id])
        if @tag
            render json: @tag 
        else 
            render json: { error: "That tag does not exist...yet"}, status: :not_acceptable
        end
    end

    def edit 
        @tag = Tag.find(params[:id])
    end

    def update
        @tag = Tag.find(params[:id])
        @tag.update(tag_params)
        render json: @tag
    end

    def destroy 
        @tag = Tag.find(params[:id])
        if @tags 
            @tags.destroy 
            render json: {message: "Tag successfully deleted"}
        else 
            render json: {message: "Failed to destroy tag"}
        end
    end

    private 

    def tag_params 
        params.require(:Tag).permit(:name, :recipe_id)
    end

end
