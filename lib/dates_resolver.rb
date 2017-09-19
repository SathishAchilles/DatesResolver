require "dates_resolver/version"
require 'logger'
# accepts Collection of ActiveRecord Objects with attributes start date and end date
# returns a collection of ActiveRecord Objects with resolved date ranges
module DatesResolver
  class AR
  def initialize(collection_of_objects=[])
    @collection = collection_of_objects
    @start_dates = @collection.map(&:start_date).uniq
    @end_dates = @collection.map(&:end_date).uniq
    @dates = (@start_dates + @end_dates).uniq.sort!
    @new_collection =[]
    @logger = Logger.new(STDOUT)
  end

  def resolve
    @collection.each do |obj|
      new_obj = obj.clone
      @dates.each_with_index do |date, i|
        if (@end_dates.include?(date) && !(@start_dates.include?(date)))
          #if not back to back also
          (@logger.debug("not fit to be resolved: date is present only in end_dates") && next)
        end

        if !(date >= obj.start_date)
          (@logger.debug("not fit to be resolved: date is lesser than current obj date") && next)
        end

        #hack for 1day overlaps
        #TODO: patch it
        if (@end_dates.include?(date) && @start_dates.include?(date))
          start_date = date
          end_date = date
          next_date = date
          increment_next_date(next_date)
        else
          # start date is set to be the date value in current iteration
          start_date = date
          next_date = @dates[i+1]
          end_date = (if @start_dates.include?(next_date)
          (next_date -1)
        else
          #seems the next coming up date is an end_date
          increment_next_date(next_date)
          next_date
        end)
      end

      new_obj.start_date = start_date
      new_obj.end_date = end_date
      @new_collection << new_obj.clone
      #resolve only 1 overlapping promotional end or exception at once.
      #also halt the resolver if the max end date is achieved
      break if (end_date == obj.end_date || end_date == @dates.last)
    end
  end
  @new_collection.uniq
  end

  private
  def add_and_sort_dates_collection(new_date,dates)
    dates << new_date
    dates.sort!.uniq!
  end

  def increment_next_date(next_date)
    begin
      if next_date != @dates.last
        add_and_sort_dates_collection(next_date + 1, @dates)
        add_and_sort_dates_collection(next_date + 1, @start_dates)
      end
    rescue NoMethodError => err
      custom_val = "NEXT_DATE seems to be null"
      #TODO: use inspect instead of to_json
      #to show more clarity in the logs
      @logger.fatal(custom_val +"\n" + err+ "\n" + e.to_json)
      @logger.fatal(err.backtrace)
      return true
    end
  end
end
end
