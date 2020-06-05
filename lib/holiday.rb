require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash.each do |season, data|
    if season == :winter
      data.map {|holiday, decorations| decorations << supply}
    end 
  end 
end 
  
def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day][1] = supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  winter_supplies = []
  holiday_hash.each do |season, data|
    if season == :winter
      data.each do |holiday, decorations| 
        winter_supplies << decorations
      end 
    end 
  end 
  winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, data|
    puts "#{season.capitalize()}:"
    data.each do |holiday, decorations|
      puts "  #{holiday.to_s.split('_').map {|word| word.capitalize!}.join(' ')}: #{decorations.join(", ")}"
    end 
  end
end 

def all_holidays_with_bbq(holiday_hash)
  holiday_hash.map do |season, data|
    data.map do |holiday, decorations|
      holiday if decorations.include?("BBQ")
    end
  end.flatten.compact
end

