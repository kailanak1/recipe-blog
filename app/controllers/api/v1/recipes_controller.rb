class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized

    def index 
        @recipes = Recipe.all 
        render json: @recipes
    end

    def create 
      
        # puts "RECIPE CREATE METHOD"
        # new_recipe_params = {
        #     title: params[:title], 
        #     summary: params[:summary],
        #     rec_steps: params[:rec_steps],
        #     rec_tags: params[:rec_tags], 
        #     user_id: user_id
        # }
     
        @recipe = Recipe.new(recipe_params)
       
        # for ingredient in @ingredients do 
        #     puts "DIDOFUD YOUU HIIIIIIT??????? #)(@#*R)($*UROGFUJEWLIU"
        #     ing = Ingredient.create(ingredient)
        #     @recipe[:ingredients] << ing 
        #     puts "sdifjlsikfje;jf    ;oej;ria4t9ur;3RFIJEwuf"
        #     puts @recipe
        # end
  
        puts "tried to create new recipe"
        if @recipe.valid? 
            puts "THIS RECIPE IS VALID"
            
            @recipe.save 
            render json: { recipe: RecipeSerializer.new(@recipe),  ingredients: @ingredients}
        else 
            render json: { error: "failed to create recipe"}, status: :not_acceptable 
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
        params.require(:recipe).permit(:title, :summary, :category, :main_pic, :user_id, :likes, :version, :ingredients, :rec_tags, :rec_steps, :ingredient_name)
    end
    
end
