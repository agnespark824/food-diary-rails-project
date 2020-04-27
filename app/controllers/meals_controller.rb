class MealsController < ApplicationController
    def index
        meals = Meal.where.not(name: nil)
    end
    
    def new
        meal = Meal.new
    end

    def create
        meal = Meal.new(meal_params)
        meal.save
        redirect_to meal_path(meal)
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



