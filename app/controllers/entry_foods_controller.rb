class EntryFoodsController < ApplicationController

    def show
        @entry_food = EntryFood.find(params[:id])
        @food = @entry_food.food
        @entry = @entry_food.entry
    end
    
    def edit
        @entry_food = EntryFood.find(params[:id])
        @food = @entry_food.food
        @entry = @entry_food.entry
    end

    def update
        @entry_food = EntryFood.find(params[:id])
        @entry_food.update(entry_food_params)
        redirect_to entry_food_path(@entry_food)
    end

    def destroy
        @entry_food = EntryFood.find(params[:id])
        @entry_id = @entry_food.entry_id
        @entry_food.destroy
        @entry = Entry.find(@entry_id)
        redirect_to entry_path(@entry), notice: "The food record has been successfully deleted."
    end

    private

    def entry_food_params
        params.require(:entry_food).permit(:servings, :meal)
    end

end

