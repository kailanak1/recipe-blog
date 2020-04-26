class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized

    def index 
        @recipes = Recipe.all 
        render json: @recipes
    end

    def create 
        @recipe = Recipe.new(recipe_params)
        if @recipe.valid? 
            @recipe.save 
            render json: { recipe: RecipeSerializer.new(@recipe)}
        else 
            render json: { error: "failed to create event"}, status: :not_acceptable 
        end
    end

    def show 
        @recipe = Recipe.find(params[:id])
        if @recipe
            render json: @recipe 
        else 
            render json: { error: "That recipe does not exist...yet"}, status: :not_acceptable
        end
    end

    def edit 
        @recipe = Recipe.find(params[:id])
        render json: @recipe
    end

    def update
        @recipe = Recipe.find(params[:id])
        @recipe.update(recipe_params)
        render json: @recipe
    end

    def destroy 
        @recipe = Recipe.find(params[:id])
        if @recipe 
            @recipe.destroy 
            render json: {message: "Recipe successfully deleted"}
        else 
            render json: {message: "Failed to destroy recipe"}
        end
    end

    private 

    def recipe_params 
        params.require(:recipe).permit(:title, :summary, :category, :main_pic, :user_id, :likes, :version)
    end
    
end
