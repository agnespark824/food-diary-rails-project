class DailyEntriesController < ApplicationController
    before_action :authentication_required
    
    def index
        params[:user_id]
        entries = User.find(params[:user_id]).daily_entries
    end
    
    def new
        entry = DailyEntry.new
    end

    def create
        entry = DailyEntry.new(entry_params)
        entry.save
        redirect_to daily_entry_path(entry)
    end

    def show
        entry = DailyEntry.find(params[:id])
    end
    
    def edit
        entry = DailyEntry.find(params[:id])
    end

    def update
        entry = DailyEntry.find(params[:id])
        entry.update(entry_params)
        redirect_to daily_entry_path(entry)
    end

    private

    def entry_params
        params.require(:daily_entry).permit(:date)
    end
end
