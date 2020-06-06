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
        binding.pry
    end

    def edit
        @entry = Entry.find(params[:id])
        @foods = Food.all
        @entry_foods = EntryFood.where(entry_id: @entry)
    end

    def update
        @entry = Entry.find(params[:id])
        @entry.update(entry_params)

        if entry_params[:food_ids]
            food_ids.each do |food_id|
                entry_food = EntryFood.new
                entry_food.entry_id = @entry 
                entry_food.food_id = food_id
                entry_food.save
            end
            redirect_to entry_path(@entry), notice: "The entry has been updated."
        elsif entry_params && !entry_params[:food_ids]
            redirect_to entry_path(@entry), notice: "The entry date has been updated."
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

    def destroy_entry_food
        @entry = Entry.find(params[:id])
        @entry_food = EntryFood.find_by(entry_id: @entry, food_id: entry_params[:food_id])
        @entry_food.destroy
        redirect_to entry_path(@entry), notice: "The entry has been updated."
    end

    private

    def entry_params
        params.require(:entry).permit(:date, :food_ids, :entry_food_ids)
    end

    def food_ids
        @food_ids = entry_params[:food_ids].collect{|id| id.to_i}
    end

end

