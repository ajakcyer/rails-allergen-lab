class IngredientsController < ApplicationController

    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        ingredient = Ingredient.create(ingredient_params)

        if ingredient.valid?
            redirect_to ingredient_path(ingredient)
        else
            flash[:my_errors] = ingredient.errors.full_messages
            redirect_to new_ingredient_path
        end
    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end

    def update
        ingredient = Ingredient.find(params[:id])
        ingredient.update(ingredient_params)

        if ingredient.valid?
            redirect_to ingredient_path(ingredient)
        else
            flash[:my_errors] = ingredient.errors.full_messages
            redirect_to edit_ingredient_path(ingredient)
        end
    end

    def destroy
        ingredient = Ingredient.find(params[:id])
        ingredient.destroy
        redirect_to ingredients_path
    end

    private

    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

end
