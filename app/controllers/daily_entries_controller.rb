class DailyEntriesController < ApplicationController
    before_action :authentication_required
    
    def index
        @user = @current_user
    end
    
    def new
        @entry = DailyEntry.new
        @entry.meals.build(meal_name: 'Breakfast')
        @entry.meals.build(meal_name: 'Breakfast')
    end

    def create
        @entry = DailyEntry.new(entry_params)
        @entry.user = @current_user
        @entry.save
        redirect_to daily_entry_path(@entry)
    end

    def show
        @entry = DailyEntry.find(params[:id])
    end
    
    def edit
        @entry = DailyEntry.find(params[:id])
    end

    def update
        @entry = DailyEntry.find(params[:id])
        @entry.update(entry_params)
        redirect_to daily_entry_path(@entry)
    end

    private

    def entry_params
        params.require(:daily_entry).permit(:entry_date)
    end
end
