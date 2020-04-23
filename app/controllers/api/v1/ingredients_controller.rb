class Api::V1::IngredientsController < ApplicationController

    def index 
        @ingredients = Ingredients.all 
        render json: @ingredients
    end

    def create 
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.valid? 
            @ingredient.save 
            render json: { recipe: IngredientSerializer.new(@ingredient)}
        else 
            render json: { error: "failed to create event"}, status: :not_acceptable 
        end
    end

    def show 
        @ingredient = Recipe.find(params[:id])
        if @ingredient
            render json: @ingredient 
        else 
            render json: { error: "That recipe does not exist...yet"}, status: :not_acceptable
        end
    end

    def update
        @ingredient = Recipe.find(params[:id])
        @ingredient.update(ingredient_params)
        render json: @ingredient
    end

    def destroy 
        @ingredient = Recipe.find(params[:id])
        if @ingredient 
            @ingredient.destroy 
            render json: {message: "Recipe successfully deleted"}
        else 
            render json: {message: "Failed to destroy recipe"}
        end
    end

    private 

    def ingredient_params 
        params.require(:recipe).permit(:title, :summary, :category, :main_pic, :user_id, :likes, :version)
    end

end
