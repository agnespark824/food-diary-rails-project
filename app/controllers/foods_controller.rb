class FoodsController < ApplicationController
    def index
        if @entry
            #@entry = Entry.find(params[:entry_id])
            @foods = @entry.foods
        elsif params[:recipe_id]
            @recipe = Recipe.find(params[:recipe_id])
            @foods = @recipe.foods
        else
            @foods = Food.all
        end
    end
    
    def new
        @food = Food.new
    end

    def create
        @food = Food.new(food_params)
        @food.save
        redirect_to food_path(@food)
    end

    def show
        @food = Food.find(params[:id])
    end
    
    def edit
        @food = Food.find(params[:id])
    end

    def update
        @food = Food.find(params[:id])
        @food.update(food_params)
        redirect_to food_path(@food)
    end

    private

    def food_params
        params.require(:food).permit(:name, :unit_type, :serving_size, :calories, :carbs, :fat, :protein, :sodium, :sugar)
    end

end

