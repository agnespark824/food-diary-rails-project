class FoodsController < ApplicationController
    def index
        if params[:user_id]
            foods = User.find(params[:user_id]).foods
        else
            foods = Food.all
        end
    end
    
    def new
        food = Food.new
    end

    def create
        food = Food.new(food_params)
        food.save
        redirect_to food_path(food)
    end

    def show
        meal = Meal.find(params[:id])
    end
    
    def edit
        meal = Meal.find(params[:id])
    end

    def update
        meal = Meal.find(params[:id])
        meal.update(meal_params)
        redirect_to meal_path(meal)
    end

    private

    def meal_params
        params.require(:meal).permit(:name)
    end

end

