require 'date'

module DailyEntriesHelper

    def format_date(entry)
        Date.strptime(entry.entry_date)
    end  

end
