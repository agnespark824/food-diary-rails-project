class EntriesController < ApplicationController
    before_action :authentication_required
    
    def index
        @user = @current_user
        @entries = @user.entries.order("date DESC")
    end
    
    def new
        @entry = Entry.new
    end

    def create
        @entry = Entry.new(entry_params)
        if Entry.where(entry_params) != true
            @entry.user = @current_user
            @entry.save
            redirect_to entry_path(@entry)
        else
            flash[:notice] = "An entry already exists for that date."
            render 'new'
        end
    end

    def show
        @entry = Entry.find(params[:id])
        @entry_foods = @entry.entry_foods

        @breakfast_foods = @entry_foods.select{|food| food.meal == "Breakfast"}
        @lunch_foods = @entry_foods.select{|food| food.meal == "Lunch"}
        @dinner_foods = @entry_foods.select{|food| food.meal == "Dinner"}
        @snack_foods = @entry_foods.select{|food| food.meal == "Snack"}
        @uncat_foods = @entry_foods.select{|food| food.meal == nil}
    end

    def edit
        @entry = Entry.find(params[:id])
        @foods = Food.all
        @entry_foods = @entry.entry_foods
    end

    def update
        @entry = Entry.find(params[:id])
        
        if entry_params
            @entry.update(entry_params)

            if food_ids
                food_ids.each do |food_id|
                    entry_food = EntryFood.new
                    entry_food.entry = @entry 
                    entry_food.food_id = food_id
                    entry_food.save
                end
            end
            redirect_to entry_path(@entry), notice: "The entry has been updated."
        else
            flash[:error] = 'Your changes were not saved.'
            render 'edit'
        end
    end

    def destroy
        @entry = Entry.find(params[:id])
        @entry.destroy
        redirect_to root_path, notice: "The entry has been successfully deleted."
    end

    private

    def entry_params
        params.require(:entry).permit(:meal)
    end

    def food_ids
        @food_ids = params[:entry][:food_ids].collect{|id| id.to_i}
    end

end

