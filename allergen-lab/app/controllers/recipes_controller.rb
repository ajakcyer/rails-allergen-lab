class RecipesController < ApplicationController

    def index
        if params[:sort]
            @recipes = Recipe.all.sort_by {|recipe| recipe.ingredients.count}.reverse
        else
            @recipes = Recipe.all 
        end
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    def new
        @recipe = Recipe.new
    end

    def create
        recipe = Recipe.create(recipe_params)

        if recipe.valid?
            redirect_to recipe_path(recipe)
        else
            flash[:my_errors] = recipe.errors.full_messages
            redirect_to new_recipe_path
        end
    end

    def edit
        @recipe = Recipe.find(params[:id])
    end

    def update
        recipe = Recipe.find(params[:id])
        recipe.update(recipe_params)
        if recipe.valid?
            redirect_to recipe_path(recipe)
        else
            flash[:my_errors] = recipe.errors.full_messages
            redirect_to edit_recipe_path(recipe)
        end
    end

    def destroy
        recipe = Recipe.find(params[:id])
        recipe.destroy
        redirect_to recipes_path
    end

    private

    def recipe_params
        params.require(:recipe).permit(:user_id, :title, :description, ingredients_attributes: [:name], ingredient_ids:[])
    end
end
