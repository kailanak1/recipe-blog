class Api::V1::IngredientsController < ApplicationController

    def index 
        @ingredients = Ingredients.all 
        render json: @ingredients
    end

    def create 
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.valid? 
            @ingredient.save 
            render json: { ingredient: IngredientSerializer.new(@ingredient)}
        else 
            render json: { error: "failed to create ingredient"}, status: :not_acceptable 
        end
    end

    def show 
        @ingredient = Ingredient.find(params[:id])
        if @ingredient
            render json: @ingredient 
        else 
            render json: { error: "That ingredient does not exist...yet"}, status: :not_acceptable
        end
    end

    def edit 
        @ingredient = Ingredient.find(params[:id])
        render json: @ingredient
    end

    def update
        @ingredient = Ingredient.find(params[:id])
        @ingredient.update(ingredient_params)
        render json: @ingredient
    end

    def destroy 
        @ingredient = Ingredient.find(params[:id])
        if @ingredient 
            @ingredient.destroy 
            render json: {message: "Ingredient successfully deleted"}
        else 
            render json: {message: "Failed to destroy ingredient"}
        end
    end

    private 

    def ingredient_params 
        params.require(:ingredient).permit(:recipe_id, :name, :amount)
    end

end
