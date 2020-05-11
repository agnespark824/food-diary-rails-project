require 'date'

class DailyEntriesController < ApplicationController
    before_action :authentication_required
    
    def index
        @user = @current_user
    end
    
    def new
        @entry = DailyEntry.new
    end

    def create
        @entry = DailyEntry.new(entry_params)
        if DailyEntry.where(entry_params) != true
            @entry.user = @current_user
            @entry.save
            redirect_to daily_entry_path(@entry)
        else
            flash[:message] = 'An entry already exists on that date.'
            render 'DailyEntries#new'
        end
    end

    def show
        @entry = DailyEntry.find(params[:id])
        @entry.meals
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
