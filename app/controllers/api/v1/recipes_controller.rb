class Api::V1::RecipesController < ApplicationController
    skip_before_action :authorized

    def index 
        @recipes = Recipe.all 
        render json: @recipes
    end

    def my_recipe
        @my_recipes = Recipe.find_by(user_id: currentUser)
        render json: @my_recipes
    end



    def create 
      
         new_recipe_params = {
            title: params[:title], 
            summary: params[:summary],
            rec_steps: params[:rec_steps],
            main_pic: params[:main_pic],
            user_id: params[:user_id]
        }
       
        recipe = Recipe.create(new_recipe_params)
       

        createIngredients(params[:ingredients], recipe.id)
       createSteps(params[:steps], recipe.id)
        createTags(params[:tags], recipe.id)
       
        render json: { recipe: RecipeSerializer.new(recipe)}
    
    end

    def createIngredients(array, id)
        recipe = Recipe.find(id)
        array.each do |ingredient|
            new_ingredient = Ingredient.create({recipe_id: id, name: ingredient[:name], amount: ingredient[:amount]})
            recipe.ingredients << new_ingredient
        end
    end

    def createSteps(array, id)
        recipe = Recipe.find(id)
        array.each do |step|
            new_step = Step.create({recipe_id: id, step_summary: step[:step_summary]})
            recipe.steps << new_step
        end
    end

    def createTags(array, id)
        recipe = Recipe.find(id)
        array.each do |tag|
            new_tag = Tag.create({recipe_id: id, name: tag})
            recipe.tags << new_tag
        end
    end

    def show 
        @recipe = Recipe.find(params[:id])
        if @recipe
            render json: {recipe: @recipe, ingredients: @recipe.ingredients, tags: @recipe.tags, steps:@recipe.steps }
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

        editIngredients(params[:ingredients], @recipe.id)

        @recipe.update(recipe_params)

        render json: @recipe
    end

    # needs to check if ingredient exists

    def editIngredients(array, id)
        recipe = Recipe.find(id)
        if recipe.ingredients
            array.each do |ingredient|
                if ingredient[:id]
                    updated_ingredient = Ingredient.update({recipe_id: id, name: ingredient[:name], amount: ingredient[:amount]}) 
                else 
                    new_ingredient = Ingredient.create({recipe_id: id, name: ingredient[:name], amount: ingredient[:amount]})
                    recipe.ingredients << new_ingredient
                end 
            end 
        end

    end

    def editSteps(array, id)
        recipe = Recipe.find(id)
        if recipe.ingredients
            array.each do |ingredient|
                if ingredient[:id]
                    updated_ingredient = Ingredient.update({recipe_id: id, name: ingredient[:name], amount: ingredient[:amount]}) 
                else 
                    new_ingredient = Ingredient.create({recipe_id: id, name: ingredient[:name], amount: ingredient[:amount]})
                    recipe.ingredients << new_ingredient
                end 
            end 
        end

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
        params.require(:recipe).permit(:title, :summary, :category, :main_pic, :user_id, :likes, :version, :rec_steps, :ingredient_name, :rec_steps=> [], :steps=> [], :ingredients=>[], :tags => [])
    end
    
end
