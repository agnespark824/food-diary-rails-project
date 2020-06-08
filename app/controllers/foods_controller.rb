class FoodsController < ApplicationController
    def index
        if params[:entry_id]
            @entry = Entry.find(params[:entry_id])
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
        
        if @food.valid?
            @food.save
            redirect_to food_path(@food)
        else
            render :new
        end
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

    def destroy
        @food = Food.find(params[:id])
        @food.destroy
        redirect_to foods_path, notice: "The food record has been successfully deleted."
    end

    private

    def food_params
        params.require(:food).permit(:name, :serving_unit, :serving_size, :calories, :carbs, :fat, :protein, :sodium, :sugar)
    end

end

