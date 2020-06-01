class EntriesController < ApplicationController
    before_action :authentication_required
    
    def index
        @user = @current_user
        @entries = @user.entries
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
            flash[:message] = 'An entry already exists on that date.'
            render 'Entries#new'
        end
    end

    def show
        @entry = Entry.find(params[:id])
    end
    
    def edit
        @entry = Entry.find(params[:id])
    end

    def update
        @entry = Entry.find(params[:id])
        @entry.update(entry_params)
        redirect_to entry_path(@entry)
    end

    private

    def entry_params
        params.require(:entry).permit(:date)
    end
end
